import 'package:desktop_file_system/src/rust/api/simple.dart' as api;
import 'package:desktop_file_system/src/rust/frb_generated.dart';

class DesktopFileSystem {
  const DesktopFileSystem();

  Future<void> init() => RustLib.init();

  Future<api.FilesInDirResult> getAllFilesInDir(String path) => api.getAllFilesInDir(path: path);

  Future<api.DirSizeResult> getDirSize(String path) => api.getDirSize(path: path);

  Future<List<api.FSEntityInfo>> findParentForFiles({required String startPath, required String filename}) =>
      api.findParentForFiles(startPath: startPath, filename: filename);

  Future<List<api.FSEntityInfo>> findParentForFilesParallel({required String startPath, required String filename}) =>
      api.findDirectoriesWithFileParallel(startPath: startPath, filename: filename);

  Future<List<api.FSEntityInfo>> findParentForFilesEfficient({required String startPath, required String filename}) =>
      api.findDirectoriesWithFileEfficient(startPath: startPath, filename: filename);

  // Future<List<String>> findDirs({required String startPath, required String dirName}) =>
  //     api.findDirs(startPath: startPath, dirName: dirName);

  Future<List<String>> findDirs3({required String startPath, required String dirName, required String fileName}) =>
      api.findDirsExcludingSubpaths(startPath: startPath, dirName: dirName, fileName: fileName);

  Future<List<api.FSEntityInfo>> getSubfolders(String path) => api.getSubfolders(path: path);

  Future<List<api.FSEntityInfo>> getFiles(String path) => api.getFiles(path: path);

  Future<List<String>> findFilesWithNameIn({required String startPath, required String filename}) =>
      api.findFilesWithNameIn(startPath: startPath, filename: filename);

  Future<Map<String, BigInt>> getSubfolderSizesForBasepaths({
    required List<String> basePaths,
    required List<String> subfolders,
  }) =>
      api.getSubfolderSizesForBasepaths(basePaths: basePaths, subfolders: subfolders);
}
