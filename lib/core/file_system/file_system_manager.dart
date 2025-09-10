import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:desktop_file_system/desktop_file_system.dart';
import 'package:dev_sweeper/core/state/app_state.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:process/process.dart';

// TODO add bool hasFiles
typedef FolderResultInfo = ({String path, List<FSEntityInfo> files, BigInt length});

class FileSystemManager {
  FileSystemManager([DesktopFileSystem? dfs]) : _dfs = dfs ?? const DesktopFileSystem();

  final DesktopFileSystem _dfs;

  Future<void> init() => _dfs.init();

  String get _userPath => switch (defaultTargetPlatform) {
    TargetPlatform.linux => Platform.environment['HOME']!,
    TargetPlatform.macOS => Platform.environment['HOME']!,
    TargetPlatform.windows => Platform.environment['USERPROFILE']!,
    _ => throw ArgumentError(),
  };

  /// Replaces /Users/MyUser with ~
  String shortenPath(String path) => path.replaceAll(_userPath, '~');

  /// TODO generic arguments
  Future<String> getDeveloperFolder() async => p.join(_userPath, 'Desktop', 'Developer');

  Map<String, String> _wrapEnv(String value) => {'PATH': value};

  // TODO windows, linux
  String get _pathEnvRaw => '/usr/local/bin/:/opt/homebrew/bin:/usr/bin/:/bin:/usr/sbin:/sbin';
  Map<String, String> get _envPath => _wrapEnv(_pathEnvRaw);

  // TODO consider other install locations
  String get _flutterEnvPathRaw => '$_userPath/fvm/default/bin';
  Map<String, String> get _flutterEnvPath => _wrapEnv(_flutterEnvPathRaw);

  String get _shorebirdEnvPathRaw => '$_userPath/.shorebird/bin/';
  Map<String, String> get _shorebirdEnvPath => _wrapEnv(_shorebirdEnvPathRaw);

  String get _rustEnvPathRaw => '$_userPath/.cargo/bin/';
  Map<String, String> get _rustEnvPath => _wrapEnv(_rustEnvPathRaw);

  Future<bool> _canRunProcess(
    String process, {
    String? environment,
  }) async {
    if (kDebugMode) {
      return const LocalProcessManager().canRun(process);
    }

    // originally LocalProcessManager().canRun worked fine in debug/release modes
    // however it always returned false when the .app was launched from finder
    // this is because macOS does not inherit shell's env so anything relying on PATH may fail
    // interestingly LocalProcessManager().canRun('xcodebuild') returns true in .app

    // even though this is in try/catch, when process cannot be run (i.e missing path), it will crash macos app
    try {
      final effectiveEnv = environment != null && environment.isNotEmpty ? '$_pathEnvRaw:$environment' : _pathEnvRaw;
      await Process.run(
        process,
        [],
        environment: {
          'PATH': effectiveEnv,
        },
      );
      return true;
    } catch (e) {
      log('Error for $process - $e');
      return false;
    }
  }

  Future<bool> get isXcodeInstalled async {
    if (defaultTargetPlatform != TargetPlatform.macOS) {
      return false;
    }

    return _canRunProcess('xcodebuild');
  }

  Future<FolderResultInfo> _getSubfolders(String path) async {
    final subfolders = await _dfs.getSubfolders(path);

    return (
      path: path,
      files: subfolders,
      length: subfolders.isEmpty ? BigInt.from(0) : subfolders.map((e) => e.len).reduce((a, b) => a + b),
    );
  }

  Future<FolderResultInfo> getXcodeArchives([String? user]) =>
      _getSubfolders(p.join(user ?? _userPath, 'Library/Developer/Xcode/Archives'));

  // user readable name -> plist -> WorkspacePath
  Future<FolderResultInfo> getXcodeDerivedData([String? user]) =>
      _getSubfolders(p.join(user ?? _userPath, 'Library/Developer/Xcode/DerivedData'));

  Future<List<FSEntityInfo>> getXcodeiOSDeviceLogs([String? user]) =>
      _dfs.getFiles(p.join(user ?? _userPath, 'Library/Developer/Xcode/iOS Device Logs'));

  Future<FolderResultInfo> getXcodeiOSDeviceSupport([String? user]) =>
      _getSubfolders(p.join(user ?? _userPath, 'Library/Developer/Xcode/iOS DeviceSupport'));

  Future<FolderResultInfo> getXcodemacOSDeviceSupport([String? user]) =>
      _getSubfolders(p.join(user ?? _userPath, 'Library/Developer/Xcode/macOS DeviceSupport'));

  Future<void> deleteFolders(Iterable<String> paths) async {
    for (final path in paths) {
      final dir = Directory(path);
      if (await dir.exists()) {
        await dir.delete(recursive: true);
      }
    }
  }

  Future<bool> get isBrewInstalled async {
    if (defaultTargetPlatform != TargetPlatform.macOS) {
      return false;
    }

    return _canRunProcess('brew');
  }

  Future<void> brewUpdateClean() async {
    await Process.run('brew', ['update'], environment: _envPath);
    await Process.run('brew', ['upgrade'], environment: _envPath);
    await Process.run('brew', ['cleanup'], environment: _envPath);

    // This operation has freed approximately 877.3MB of disk space.
  }

  Future<bool> get isFlutterInstalled async {
    return await _canRunProcess(
          'flutter',
          environment: _flutterEnvPathRaw,
        ) ||
        await isFVMInstalled;
  }

  Future<List<FSEntityInfo>> getAllFlutterProjects(String startPath) async {
    final stopwatch = Stopwatch()..start();

    // parallel does not seem to be faster than normal
    // regardless of order, 2nd method is faster. Perhaps data is cached?

    var results = await _dfs.findParentForFiles(startPath: startPath, filename: 'pubspec.yaml');
    log('rust1 get took ${stopwatch.elapsed}');
    results.sort((a, b) => a.path.compareTo(b.path));

    stopwatch.stop();
    log('rust1 & flutter sort get took ${stopwatch.elapsed}');
    stopwatch.reset();

    // stopwatch.start();
    // var results2 = await _dfs.findParentForFilesParallel(startPath: startPath, filename: 'pubspec.yaml');
    // log('rust2 get took ${stopwatch.elapsed}');
    // results2.sort((a, b) => a.path.compareTo(b.path));

    // stopwatch.stop();
    // log('rust2 & flutter sort get took ${stopwatch.elapsed}');
    // stopwatch.reset();

    // here example in package etc. sizing is lost - improve

    stopwatch.start();
    final returnArray = <String>[];
    for (final result in results) {
      final path = result.path;
      if (!returnArray.any((t) => path.startsWith(t))) {
        returnArray.add(path);
      }
    }
    stopwatch.stop();
    log('Flutter sort took ${stopwatch.elapsed}');
    stopwatch.reset();

    stopwatch.start();
    final sizeResults = await _dfs.getSubfolderSizesForBasepaths(
      basePaths: returnArray,
      subfolders: ['.dart_tool', 'build'],
    );
    stopwatch.stop();
    log('Flutter clean estimate took ${stopwatch.elapsed}');
    stopwatch.reset();

    return returnArray
        .map((e) => FSEntityInfo(path: e, len: sizeResults[e] ?? BigInt.zero))
        .where((e) => e.len.toInt() > 0)
        .toList()
      ..sortBySize();

    /*

    // even slower

    final result = await _dfs.findParentForFilesEfficient(startPath: startPath, filename: 'pubspec.yaml');
    log('rust get took ${stopwatch.elapsed}');
    final mappedResults = result.map((e) => e.path).toList();
    log('Flutter + rust total took ${stopwatch.elapsed}');

    return mappedResults;
    */
  }

  Future<void> cleanFlutterProjects(Iterable<String> paths) async {
    for (final path in paths) {
      if (await Directory(path).exists()) {
        log('Cleaning flutter project $path');
        await Process.run(
          'flutter',
          ['clean'],
          workingDirectory: path,
          // environment: _flutterEnvPath,
        );
      }
    }
  }

  Future<bool> get isFVMInstalled async {
    return _canRunProcess('fvm');
    // return _canRunProcess('fvm', environment: '/opt/homebrew/bin/');
    // return Directory('$_userPath/fvm').exists();
    // return false;
  }

  Future<List<FMVVersion>> getAllFVMConfigs(Iterable<String> paths) async {
    log('getAllFVMConfigs...');

    final allVersions = <(String, String)>{};

    final process = await Process.run('fvm', ['api', 'list']);
    final map = jsonDecode(process.stdout);
    for (final version in map['versions']) {
      allVersions.add((version['name'], version['directory']));
    }

    final usedVersions = <String>{};

    final rawResults = await Future.wait(
      paths.map(
        (path) => _dfs.findFilesWithNameIn(startPath: path, filename: '.fvmrc'),
      ),
    );
    final results = rawResults.fold(
      <String>[],
      (previousValue, element) => [...previousValue, ...element],
    );

    for (final result in results) {
      final file = File(result);
      if (await file.exists()) {
        final map = jsonDecode(await file.readAsString());
        final version = map['flutter'];
        if (version != null) {
          usedVersions.add(version);
        }
      }
    }

    // log(usedVersions.toString());

    final unusedVersions = allVersions.where((e) => !usedVersions.contains(e.$1));

    // log('-----');
    // log(unusedVersions.toString());

    final returnArray = <FMVVersion>[];

    for (final version in unusedVersions) {
      final result = await _dfs.getDirSize(version.$2);
      returnArray.add((version: version.$1, size: result.len));
    }

    // results.sort();

    // log(results.toString());
    // log('-----');

    return returnArray;
  }

  Future<void> removeFVMVersions(Iterable<String> versions) async {
    for (final version in versions) {
      await Process.run('fvm', ['remove', version]);
    }
  }

  Future<bool> get isShorebirdInstalled async {
    return _canRunProcess('shorebird', environment: _shorebirdEnvPathRaw);
  }

  Future<FSEntityInfo> getShorebirdCacheInfo() async {
    final result = await _dfs.getDirSize(p.join(_userPath, '.shorebird/bin/cache'));
    return FSEntityInfo(path: result.path, len: result.len);
  }

  Future<void> shorebirdClearCache() => Process.run(
    'shorebird',
    ['cache', 'clean'],
    // environment: _shorebirdEnvPath,
  );

  Future<bool> get isNodeInstalled async {
    return _canRunProcess('node');
  }

  Future<List<FSEntityInfo>> getAllNodeProjects(String startPath) async {
    final folderResult = await _dfs.findDirs3(startPath: startPath, dirName: 'node_modules', fileName: 'package.json');
    final sizeResult = await _dfs.getSubfolderSizesForBasepaths(
      basePaths: folderResult,
      subfolders: ['node_modules'],
    );

    return folderResult
        .map((e) => FSEntityInfo(path: e, len: sizeResult[e] ?? BigInt.zero))
        .where((e) => e.len.toInt() > 0)
        .toList()
      ..sortBySize();
  }

  Future<void> cleanNodeProjects(Iterable<String> paths) async {
    for (final path in paths) {
      // rm -rf node_modules/
      final dir = Directory(p.join(path, 'node_modules'));
      if (await dir.exists()) {
        log('Deleting ${dir.path}...');
        await dir.delete(recursive: true);
      }
    }
  }

  Future<bool> get isRustInstalled async {
    return _canRunProcess('rustup', environment: _rustEnvPathRaw);
  }

  Future<List<FSEntityInfo>> getAllRustProjects(String startPath) async {
    final folderResult = await _dfs.findParentForFilesParallel(startPath: startPath, filename: 'Cargo.toml');
    final sizeResult = await _dfs.getSubfolderSizesForBasepaths(
      basePaths: folderResult.map((e) => e.path).toList(),
      subfolders: ['target'],
    );

    return folderResult
        .map((e) => FSEntityInfo(path: e.path, len: sizeResult[e.path] ?? BigInt.zero))
        .where((e) => e.len.toInt() > 0)
        .toList()
      ..sortBySize();
  }

  Future<void> cleanRustProjects(Iterable<String> paths) async {
    for (final path in paths) {
      if (await Directory(path).exists()) {
        log('Cleaning $path');
        await Process.run(
          'cargo',
          ['clean'],
          workingDirectory: path,
          environment: _rustEnvPath,
        );
      }
    }
  }
}

extension on List<FSEntityInfo> {
  void sortBySize() => sort((a, b) => b.len.compareTo(a.len));
}
