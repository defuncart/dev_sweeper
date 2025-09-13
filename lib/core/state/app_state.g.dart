// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fileSystemManager)
const fileSystemManagerProvider = FileSystemManagerProvider._();

final class FileSystemManagerProvider
    extends $FunctionalProvider<FileSystemManager, FileSystemManager, FileSystemManager>
    with $Provider<FileSystemManager> {
  const FileSystemManagerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fileSystemManagerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fileSystemManagerHash();

  @$internal
  @override
  $ProviderElement<FileSystemManager> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FileSystemManager create(Ref ref) {
    return fileSystemManager(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FileSystemManager value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FileSystemManager>(value),
    );
  }
}

String _$fileSystemManagerHash() => r'b65da29d0cf8ee6e3bafea81fd79dda0e5d0aae3';

@ProviderFor(ToolController)
const toolControllerProvider = ToolControllerProvider._();

final class ToolControllerProvider extends $NotifierProvider<ToolController, ToolsState> {
  const ToolControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toolControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toolControllerHash();

  @$internal
  @override
  ToolController create() => ToolController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ToolsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ToolsState>(value),
    );
  }
}

String _$toolControllerHash() => r'4f2bcdb6c58ab3335df127a8548e56a1d6defbcf';

abstract class _$ToolController extends $Notifier<ToolsState> {
  ToolsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ToolsState, ToolsState>;
    final element =
        ref.element as $ClassProviderElement<AnyNotifier<ToolsState, ToolsState>, ToolsState, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(XcodeController)
const xcodeControllerProvider = XcodeControllerProvider._();

final class XcodeControllerProvider extends $AsyncNotifierProvider<XcodeController, XcodeState> {
  const XcodeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'xcodeControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$xcodeControllerHash();

  @$internal
  @override
  XcodeController create() => XcodeController();
}

String _$xcodeControllerHash() => r'89c4ef3b0f145f3eb7cdaf9624a37856422d3511';

abstract class _$XcodeController extends $AsyncNotifier<XcodeState> {
  FutureOr<XcodeState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<XcodeState>, XcodeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<XcodeState>, XcodeState>,
              AsyncValue<XcodeState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(BrewController)
const brewControllerProvider = BrewControllerProvider._();

final class BrewControllerProvider extends $AsyncNotifierProvider<BrewController, bool> {
  const BrewControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'brewControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$brewControllerHash();

  @$internal
  @override
  BrewController create() => BrewController();
}

String _$brewControllerHash() => r'dd65dcd38845db740d3c18b1a775e3c02a5fda72';

abstract class _$BrewController extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element as $ClassProviderElement<AnyNotifier<AsyncValue<bool>, bool>, AsyncValue<bool>, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(FlutterController)
const flutterControllerProvider = FlutterControllerProvider._();

final class FlutterControllerProvider extends $AsyncNotifierProvider<FlutterController, FlutterState> {
  const FlutterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'flutterControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$flutterControllerHash();

  @$internal
  @override
  FlutterController create() => FlutterController();
}

String _$flutterControllerHash() => r'535fc4daae97529aa5b5165b8bbb68906cc584b2';

abstract class _$FlutterController extends $AsyncNotifier<FlutterState> {
  FutureOr<FlutterState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<FlutterState>, FlutterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<FlutterState>, FlutterState>,
              AsyncValue<FlutterState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(FVMController)
const fVMControllerProvider = FVMControllerProvider._();

final class FVMControllerProvider extends $AsyncNotifierProvider<FVMController, FVMState> {
  const FVMControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fVMControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fVMControllerHash();

  @$internal
  @override
  FVMController create() => FVMController();
}

String _$fVMControllerHash() => r'b01f9992b119acde53843093c2f3f25d2bf9dfe1';

abstract class _$FVMController extends $AsyncNotifier<FVMState> {
  FutureOr<FVMState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<FVMState>, FVMState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<FVMState>, FVMState>,
              AsyncValue<FVMState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ShorebirdController)
const shorebirdControllerProvider = ShorebirdControllerProvider._();

final class ShorebirdControllerProvider extends $AsyncNotifierProvider<ShorebirdController, BigInt> {
  const ShorebirdControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shorebirdControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shorebirdControllerHash();

  @$internal
  @override
  ShorebirdController create() => ShorebirdController();
}

String _$shorebirdControllerHash() => r'a6f6e6e432ea3d9fd5490be6312090cfbf613b33';

abstract class _$ShorebirdController extends $AsyncNotifier<BigInt> {
  FutureOr<BigInt> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<BigInt>, BigInt>;
    final element =
        ref.element
            as $ClassProviderElement<AnyNotifier<AsyncValue<BigInt>, BigInt>, AsyncValue<BigInt>, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(NodeController)
const nodeControllerProvider = NodeControllerProvider._();

final class NodeControllerProvider extends $AsyncNotifierProvider<NodeController, NodeState> {
  const NodeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nodeControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nodeControllerHash();

  @$internal
  @override
  NodeController create() => NodeController();
}

String _$nodeControllerHash() => r'a59a5ad2bc548449cd459e0b4185a5f547890fa1';

abstract class _$NodeController extends $AsyncNotifier<NodeState> {
  FutureOr<NodeState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<NodeState>, NodeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<NodeState>, NodeState>,
              AsyncValue<NodeState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(RustController)
const rustControllerProvider = RustControllerProvider._();

final class RustControllerProvider extends $AsyncNotifierProvider<RustController, RustState> {
  const RustControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rustControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rustControllerHash();

  @$internal
  @override
  RustController create() => RustController();
}

String _$rustControllerHash() => r'5cea9411c122bc045922f2289ab9e45d89f2e9ea';

abstract class _$RustController extends $AsyncNotifier<RustState> {
  FutureOr<RustState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<RustState>, RustState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<RustState>, RustState>,
              AsyncValue<RustState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
