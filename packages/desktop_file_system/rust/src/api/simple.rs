use walkdir::{DirEntry, WalkDir};
use fancy_regex::Regex;
use std::fs;
use std::path::Path;
use rayon::prelude::*;
use std::collections::HashSet;
use std::collections::HashMap;
use std::io;

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    flutter_rust_bridge::setup_default_user_utils();
}

pub async fn get_all_files_in_dir(path: String) -> FilesInDirResult  {
    let mut files: Vec<FSEntityInfo> = WalkDir::new(String::from(&path))
        .min_depth(1)
        .max_depth(3)
        .into_iter()
        .filter_map(|entry| entry.ok())
        .filter(|e| e.file_type().is_file())
        .map(|e| FSEntityInfo {
            path: e.path().display().to_string(),
            len: e.metadata().unwrap().len(),
        })
        .collect();
    files.sort_by(|a, b| b.len.cmp(&a.len));

    FilesInDirResult{
        path: String::from(&path),
        files: files
    }
}

#[flutter_rust_bridge::frb(dart_metadata=("freezed", "immutable" import "package:meta/meta.dart" as meta))]
pub struct FilesInDirResult {
    pub path: String,
    pub files: Vec<FSEntityInfo>,
}

#[flutter_rust_bridge::frb(dart_metadata=("freezed", "immutable" import "package:meta/meta.dart" as meta))]
pub struct FSEntityInfo {
    pub path: String,
    pub len: u64,
}

pub fn get_dir_size(path: String) -> DirSizeResult  {
    let files = WalkDir::new(String::from(&path))
        .into_iter()
        .filter_map(|entry| entry.ok())
        .filter_map(|entry| entry.metadata().ok())
        .filter(|metadata| metadata.is_file());

    DirSizeResult{
        path: String::from(&path),
        // n_files: files.count() as u32,
        n_files: 0,
        len: files.fold(0, |acc, m| acc + m.len())
    }
}

#[flutter_rust_bridge::frb(dart_metadata=("freezed", "immutable" import "package:meta/meta.dart" as meta))]
pub struct DirSizeResult {
    pub path: String,
    pub n_files: u32,
    pub len: u64,
}

fn is_not_hidden(entry: &DirEntry) -> bool {
    entry
         .file_name()
         .to_str()
         .map(|s| entry.depth() == 0 || !s.starts_with("."))
         // .map(|s| !s.starts_with('.'))
         .unwrap_or(false)
}

pub async fn find_parent_for_files(start_path: String, filename: String) -> Vec<FSEntityInfo> {
    let mut vec: Vec<FSEntityInfo> = Vec::new();

    for entry in WalkDir::new(start_path)
            .follow_links(true)
            .into_iter()
            .filter_entry(|e| is_not_hidden(e))
            .filter_map(|e| e.ok()) {
                let f_name = entry.file_name().to_string_lossy();

                if f_name.eq(&filename) {
                    vec.push(
                        FSEntityInfo {
                            // path: e.path().display().to_string(),
                            path: entry.path().parent().unwrap().display().to_string(),
                            // len: get_dir_size(e.path().display().to_string()).len,
                            len: 0
                        }
                    );
                }
            }
        
    vec
}

pub async fn find_directories_with_file_parallel(start_path: &str, filename: &str) -> Vec<FSEntityInfo> {
    // Collect all entries using WalkDir, then process them in parallel.
    let entries: Vec<_> = WalkDir::new(start_path)
        .into_iter()
        .filter_entry(|e| is_not_hidden(e))
        .filter_map(Result::ok)  // Filter out the ones that resulted in errors
        .collect();

    // Perform parallel processing
    entries.par_iter()
        .filter_map(|entry| {
            // If it's a file and matches the filename, return the parent directory
            if entry.file_name() == filename && entry.file_type().is_file() {
                Some(FSEntityInfo {
                    path: entry.path().parent().unwrap().display().to_string(),
                    len: 0,
                })
            } else {
                None
            }
        })
        .collect()
}

fn dir_contains_file(dir: &Path, filename: &str) -> bool {
    match fs::read_dir(dir) {
        Ok(read_dir) => read_dir
            .filter_map(Result::ok)
            .any(|entry| {
                entry.file_type().map(|ft| ft.is_file()).unwrap_or(false)
                    && entry.file_name() == filename
            }),
        Err(_) => false,
    }
}

/// Optimized: returns FSEntityInfo of files named `filename`, skipping deeper traversal once found
pub async fn find_directories_with_file_efficient(start_path: &str, filename: &str) -> Vec<FSEntityInfo> {
    let mut results = Vec::new();
    let mut seen_dirs = HashSet::new();

    let walker = WalkDir::new(start_path)
        .into_iter()
        // .filter_entry(|e| {
        //     // Only descend into unseen directories that are not hidden
        //     is_not_hidden(e) && match e.path().is_dir() {
        //         true => !seen_dirs.contains(e.path()),
        //         false => true,
        //     }
        // });
        .filter_entry(|e| is_not_hidden(e));

    for entry in walker.filter_map(Result::ok) {
        let path = entry.path();

        if path.is_dir() {
            // Check if this dir contains the target file
            if dir_contains_file(path, filename) {
                seen_dirs.insert(path.to_path_buf());

                // Extract file info
                if let Ok(read_dir) = fs::read_dir(path) {
                    for entry in read_dir.filter_map(Result::ok) {
                        if entry.file_name() == filename {
                            results.push(FSEntityInfo {
                                path: entry.path().parent().unwrap().display().to_string(),
                                len: 0,
                            });
                        }
                    }
                }
            }
        }
    }

    results
}

// returns an array of full paths which end with dir_name inside start_path
// in the case that dir_name is repeated, such paths are ignored
// i.e. project/node_modules/@eslint/**/node_modules
pub async fn find_dirs(start_path: String, dir_name: String) -> Vec<String> {
    let mut vec: Vec<String> = Vec::new();
    let reg_ex = Regex::new(&dir_name).unwrap();

    for entry in WalkDir::new(start_path)
            .follow_links(true)
            .into_iter()
            .filter_map(|e| e.ok()) {
                if entry.metadata().unwrap().is_dir() {
                    let f_name = entry.file_name().to_string_lossy();
                    
                    if f_name.eq(&dir_name) {
                        let f_path = entry.path().display().to_string();
                        let count = reg_ex.find_iter(&f_path).count() - 1;
                        // expect at least 1 dir_name - if more, ignore
                        if count.eq(&usize::MIN) {
                            vec.push(f_path);
                        }
                    }
                }
            }

    vec
}

fn contains_subpath(entry: &DirEntry, subpath: &str) -> bool {
    entry
         .file_name()
         .to_str()
         .map(|s| s.contains(subpath))
         .unwrap_or(false)
}

// returns an array of full paths which end with dir_name inside start_path
// in the case that dir_name is repeated, such paths are ignored
// i.e. project/node_modules/@eslint/**/node_modules
pub async fn find_dirs_excluding_subpaths(start_path: String, dir_name: String, file_name: String) -> Vec<String> {
    let mut vec: Vec<String> = Vec::new();

    for entry in WalkDir::new(start_path)
            .follow_links(true)
            .into_iter()
            // .filter_entry(|e| is_not_hidden(e))
            // .filter_entry(|e| !contains_subpath(e, &dir_name))
            .filter_entry(|e| is_not_hidden(e) && !contains_subpath(e, &dir_name))
            .filter_map(|e| e.ok()) {
                let f_name = entry.file_name().to_string_lossy();

                if f_name.eq(&file_name) {
                    vec.push(entry.path().parent().unwrap().display().to_string());
                }
            }

    vec
}

pub async fn get_subfolders(path: String) -> Vec<FSEntityInfo> {
    let files: Vec<FSEntityInfo> = WalkDir::new(String::from(&path))
        .min_depth(1)
        .max_depth(1)
        .into_iter()
        .filter_map(|entry| entry.ok())
        .filter(|e| e.file_type().is_dir())
        .map(|e| FSEntityInfo {
            path: e.path().display().to_string(),
            len: get_dir_size(e.path().display().to_string()).len,
        })
        .collect();

    files
}

pub async fn get_files(path: String) -> Vec<FSEntityInfo> {
    let files: Vec<FSEntityInfo> = WalkDir::new(String::from(&path))
        .min_depth(1)
        .max_depth(1)
        .into_iter()
        .filter_map(|entry| entry.ok())
        .filter(|e| e.file_type().is_file())
        .map(|e| FSEntityInfo {
            path: e.path().display().to_string(),
            len: get_dir_size(e.path().display().to_string()).len,
        })
        .collect();

    files
}

pub async fn find_files_with_name_in(start_path: String, filename: String) -> Vec<String> {
    let mut vec: Vec<String> = Vec::new();

    for entry in WalkDir::new(start_path)
            .follow_links(true)
            .into_iter()
            // .filter_entry(|e| is_not_hidden(e))
            .filter_map(|e| e.ok()) {
                let f_name = entry.file_name().to_string_lossy();

                if f_name.eq(&filename) {
                    vec.push(entry.path().display().to_string());
                }
            }

    vec
}


pub fn get_subfolder_sizes_for_basepaths(base_paths: Vec<String>, subfolders: Vec<String>) -> HashMap<String, u64> {
    let mut folder_sizes = HashMap::new();

    for base_path in base_paths {
        let total_size = calculate_subfolder_size(&base_path, &subfolders);
        // Store the result, unwrap the Result (or 0 on error)
        folder_sizes.insert(base_path.to_string(), total_size.unwrap_or(0)); 
    }

    folder_sizes
}

fn calculate_subfolder_size(base_path: &String, subfolders: &[String]) -> io::Result<u64> {
    let mut total_size = 0;

    for subfolder in subfolders {
        let folder_path = Path::new(base_path).join(subfolder);

        let result = get_dir_size(folder_path.to_str().unwrap_or("").to_string());

        total_size += result.len;
    }

    Ok(total_size)
}
