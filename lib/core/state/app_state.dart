import 'dart:developer' as dev show log;

import 'package:desktop_file_system/desktop_file_system.dart';
import 'package:dev_sweeper/core/file_system/file_system_manager.dart';
import 'package:dev_sweeper/core/models/tool.dart';
import 'package:dev_sweeper/core/state/project_folders_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@Riverpod(keepAlive: true)
FileSystemManager fileSystemManager(Ref ref) => throw UnimplementedError();

@Riverpod(keepAlive: true)
class ToolController extends _$ToolController {
  @override
  ToolsState build() {
    _init();
    return const ToolsState.loading();
  }

  Future<void> _init() async {
    await ref.read(projectFoldersControllerProvider.notifier).init();

    final fs = ref.read(fileSystemManagerProvider);
    final isXcodeInstalled = await fs.isXcodeInstalled;
    final isBrewInstalled = await fs.isBrewInstalled;
    final isFlutterInstalled = await fs.isFlutterInstalled;
    final isFVMInstalled = await fs.isFVMInstalled;
    final isShorebirdInstalled = await fs.isShorebirdInstalled;
    final isNodeInstalled = await fs.isNodeInstalled;
    final isRustInstalled = await fs.isRustInstalled;

    final tools = <Tool>[];
    if (isXcodeInstalled) {
      tools.add(Tool.xcode);
      ref.read(xcodeControllerProvider.notifier);
    }
    if (isBrewInstalled) {
      tools.add(Tool.homebrew);
    }
    if (isFlutterInstalled) {
      tools.add(Tool.flutter);
      ref.read(flutterControllerProvider.notifier);
    }
    if (isFVMInstalled) {
      tools.add(Tool.fvm);
      ref.read(fVMControllerProvider.notifier);
    }
    if (isShorebirdInstalled) {
      tools.add(Tool.shorebird);
      ref.read(shorebirdControllerProvider.notifier);
    }
    if (isNodeInstalled) {
      tools.add(Tool.node);
      ref.read(nodeControllerProvider.notifier);
    }
    if (isRustInstalled) {
      tools.add(Tool.rust);
      ref.read(rustControllerProvider.notifier);
    }
    state = ToolsState.data(tools: tools);
  }
}

@freezed
sealed class ToolsState with _$ToolsState {
  const factory ToolsState.loading() = ToolsStateLoading;
  const factory ToolsState.data({
    required List<Tool> tools,
  }) = ToolsStateData;
}

@Riverpod(keepAlive: true)
class XcodeController extends _$XcodeController {
  @override
  FutureOr<XcodeState> build() => _get();

  Future<XcodeState> _get() async {
    final fs = ref.read(fileSystemManagerProvider);
    final stopwatch = Stopwatch()..start();
    final archives = await fs.getXcodeArchives();
    final derivedData = await fs.getXcodeDerivedData();
    final iOSDeviceLogs = await fs.getXcodeiOSDeviceLogs();
    final iOSDeviceSupport = await fs.getXcodeiOSDeviceSupport();
    final macOSDeviceSupport = await fs.getXcodemacOSDeviceSupport();
    stopwatch.stop();
    dev.log('Xcode took ${stopwatch.elapsed}');

    return XcodeState(
      archives: archives,
      derivedData: derivedData,
      iOSDeviceLogs: iOSDeviceLogs,
      iOSDeviceSupport: iOSDeviceSupport,
      macOSDeviceSupport: macOSDeviceSupport,
    );
  }

  Future<void> deleteFolders(Iterable<String> paths) async {
    state = const AsyncValue.loading();

    final fs = ref.read(fileSystemManagerProvider);
    await fs.deleteFolders(paths);

    state = await AsyncValue.guard(_get);
  }
}

@freezed
sealed class XcodeState with _$XcodeState {
  const factory XcodeState({
    required FolderResultInfo archives,
    required FolderResultInfo derivedData,
    required List<FSEntityInfo> iOSDeviceLogs,
    required FolderResultInfo iOSDeviceSupport,
    required FolderResultInfo macOSDeviceSupport,
  }) = _XcodeState;
}

@Riverpod(keepAlive: true)
class BrewController extends _$BrewController {
  @override
  FutureOr<bool> build() => true;

  Future<void> updateClean() async {
    state = const AsyncValue.loading();

    final fs = ref.read(fileSystemManagerProvider);
    final stopwatch = Stopwatch()..start();
    await fs.brewUpdateClean();
    stopwatch.stop();
    dev.log('Brew took ${stopwatch.elapsed}');

    // convert to void?
    state = const AsyncData(true);
  }
}

@Riverpod(keepAlive: true)
class FlutterController extends _$FlutterController {
  @override
  FutureOr<FlutterState> build() => _get();

  Future<FlutterState> _get() async {
    final projectDirs = ref.watch(projectFoldersControllerProvider);
    final fs = ref.read(fileSystemManagerProvider);

    final groupedProjects = <FilesInDirResult>[];
    for (final projectDir in projectDirs) {
      final stopwatch = Stopwatch()..start();
      final result = await fs.getAllFlutterProjects(projectDir);
      groupedProjects.add(
        FilesInDirResult(path: projectDir, files: result),
      );
      stopwatch.stop();
      dev.log('Flutter get took ${stopwatch.elapsed} for $projectDir');
    }

    return FlutterState(
      globalCacheSize: (await fs.getDartPubCacheInfo()).len,
      groupedProjects: groupedProjects,
    );
  }

  Future<void> deleteProjects(Iterable<String> paths) async {
    state = const AsyncValue.loading();

    final stopwatch = Stopwatch()..start();
    final fs = ref.read(fileSystemManagerProvider);
    await fs.deleteFolders(paths);
    stopwatch.stop();
    dev.log('Flutter delete took ${stopwatch.elapsed}');

    state = await AsyncValue.guard(_get);
  }

  Future<void> cleanGlobalCache() async {
    state = const AsyncValue.loading();

    final stopwatch = Stopwatch()..start();
    final fs = ref.read(fileSystemManagerProvider);
    await fs.cleanDartPubCache();
    stopwatch.stop();
    dev.log('Flutter global clean took ${stopwatch.elapsed}');

    state = await AsyncValue.guard(_get);
  }

  Future<void> cleanProjects(Iterable<String> paths) async {
    state = const AsyncValue.loading();

    final stopwatch = Stopwatch()..start();
    final fs = ref.read(fileSystemManagerProvider);
    await fs.cleanFlutterProjects(paths);
    stopwatch.stop();
    dev.log('Flutter projects clean took ${stopwatch.elapsed}');

    state = await AsyncValue.guard(_get);
  }
}

@freezed
sealed class FlutterState with _$FlutterState {
  const factory FlutterState({
    required BigInt globalCacheSize,
    required List<FilesInDirResult> groupedProjects,
  }) = _FlutterState;
}

@Riverpod(keepAlive: true)
class FVMController extends _$FVMController {
  @override
  FutureOr<FVMState> build() => _get();

  Future<FVMState> _get() async {
    final projectDirs = ref.watch(projectFoldersControllerProvider);
    final fs = ref.read(fileSystemManagerProvider);

    final stopwatch = Stopwatch()..start();
    final developer = await fs.getAllFVMConfigs(projectDirs);
    stopwatch.stop();
    dev.log('fvm took ${stopwatch.elapsed} for $projectDirs');

    return FVMState(
      path: projectDirs.last,
      developer: developer,
    );
  }

  Future<void> removeVersions(Iterable<String> versions) async {
    state = const AsyncValue.loading();

    final stopwatch = Stopwatch()..start();
    final fs = ref.read(fileSystemManagerProvider);
    await fs.removeFVMVersions(versions);
    stopwatch.stop();
    dev.log('FVM remove took ${stopwatch.elapsed}');

    state = await AsyncValue.guard(_get);
  }
}

typedef FMVVersion = ({String version, BigInt size});

@freezed
sealed class FVMState with _$FVMState {
  const factory FVMState({
    required String path,
    required List<FMVVersion> developer,
  }) = _FVMState;
}

@Riverpod(keepAlive: true)
class ShorebirdController extends _$ShorebirdController {
  @override
  FutureOr<BigInt> build() => _get();

  Future<BigInt> _get() async {
    final result = await ref.read(fileSystemManagerProvider).getShorebirdCacheInfo();
    return result.len;
  }

  Future<void> clearCache() async {
    state = const AsyncValue.loading();

    final fs = ref.read(fileSystemManagerProvider);
    final stopwatch = Stopwatch()..start();
    await fs.shorebirdClearCache();
    stopwatch.stop();
    dev.log('Shorebird took ${stopwatch.elapsed}');

    state = await AsyncValue.guard(_get);
  }
}

@Riverpod(keepAlive: true)
class NodeController extends _$NodeController {
  @override
  FutureOr<NodeState> build() => _get();

  Future<NodeState> _get() async {
    final projectDirs = ref.watch(projectFoldersControllerProvider);
    final fs = ref.read(fileSystemManagerProvider);

    final groupedProjects = <FilesInDirResult>[];
    for (final projectDir in projectDirs) {
      final stopwatch = Stopwatch()..start();
      final result = await fs.getAllNodeProjects(projectDir);
      groupedProjects.add(
        FilesInDirResult(path: projectDir, files: result),
      );
      stopwatch.stop();
      dev.log('Node get took ${stopwatch.elapsed} for $projectDir');
    }

    return NodeState(
      globalCacheSize: (await fs.getNodeCacheInfo()).len,
      groupedProjects: groupedProjects,
    );
  }

  Future<void> deleteProjects(Iterable<String> paths) async {
    state = const AsyncValue.loading();

    final stopwatch = Stopwatch()..start();
    final fs = ref.read(fileSystemManagerProvider);
    await fs.deleteFolders(paths);
    stopwatch.stop();
    dev.log('Node delete took ${stopwatch.elapsed}');

    state = await AsyncValue.guard(_get);
  }

  Future<void> cleanGlobalCache() async {
    state = const AsyncValue.loading();

    final stopwatch = Stopwatch()..start();
    final fs = ref.read(fileSystemManagerProvider);
    await fs.cleanNodeCache();
    stopwatch.stop();
    dev.log('Node global clean took ${stopwatch.elapsed}');

    state = await AsyncValue.guard(_get);
  }

  Future<void> cleanProjects(Iterable<String> paths) async {
    state = const AsyncValue.loading();

    final stopwatch = Stopwatch()..start();
    final fs = ref.read(fileSystemManagerProvider);
    await fs.cleanNodeProjects(paths);
    stopwatch.stop();
    dev.log('Node projects clean took ${stopwatch.elapsed}');

    state = await AsyncValue.guard(_get);
  }
}

@freezed
sealed class NodeState with _$NodeState {
  const factory NodeState({
    required BigInt globalCacheSize,
    required List<FilesInDirResult> groupedProjects,
  }) = _NodeState;
}

@Riverpod(keepAlive: true)
class RustController extends _$RustController {
  @override
  FutureOr<RustState> build() => _get();

  Future<RustState> _get() async {
    final projectDirs = ref.watch(projectFoldersControllerProvider);
    final fs = ref.read(fileSystemManagerProvider);

    final groupedProjects = <FilesInDirResult>[];
    for (final projectDir in projectDirs) {
      final stopwatch = Stopwatch()..start();
      final result = await fs.getAllRustProjects(projectDir);

      groupedProjects.add(
        FilesInDirResult(
          path: projectDir,
          files: result,
        ),
      );
      stopwatch.stop();
      dev.log('Rust get took ${stopwatch.elapsed} for $projectDir');
    }

    return RustState(
      globalCacheSize: (await fs.getRustCacheInfo()).len,
      groupedProjects: groupedProjects,
    );
  }

  Future<void> deleteProjects(Iterable<String> paths) async {
    state = const AsyncValue.loading();

    final stopwatch = Stopwatch()..start();
    final fs = ref.read(fileSystemManagerProvider);
    await fs.deleteFolders(paths);
    stopwatch.stop();
    dev.log('Rust delete took ${stopwatch.elapsed}');

    state = await AsyncValue.guard(_get);
  }

  Future<void> cleanGlobalCache() async {
    state = const AsyncValue.loading();

    final stopwatch = Stopwatch()..start();
    final fs = ref.read(fileSystemManagerProvider);
    await fs.cleanRustCache();
    stopwatch.stop();
    dev.log('Rust global clean took ${stopwatch.elapsed}');

    state = await AsyncValue.guard(_get);
  }

  Future<void> cleanProjects(Iterable<String> paths) async {
    state = const AsyncValue.loading();

    final stopwatch = Stopwatch()..start();
    final fs = ref.read(fileSystemManagerProvider);
    await fs.cleanRustProjects(paths);
    stopwatch.stop();
    dev.log('Rust projects clean took ${stopwatch.elapsed}');

    state = await AsyncValue.guard(_get);
  }
}

@freezed
sealed class RustState with _$RustState {
  const factory RustState({
    required BigInt globalCacheSize,
    required List<FilesInDirResult> groupedProjects,
  }) = _RustState;
}
