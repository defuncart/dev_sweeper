// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_folders_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProjectFoldersController)
const projectFoldersControllerProvider = ProjectFoldersControllerProvider._();

final class ProjectFoldersControllerProvider extends $NotifierProvider<ProjectFoldersController, List<String>> {
  const ProjectFoldersControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectFoldersControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectFoldersControllerHash();

  @$internal
  @override
  ProjectFoldersController create() => ProjectFoldersController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$projectFoldersControllerHash() => r'3835fbd800fb8747309ccaa587ab4c4f62a9e3af';

abstract class _$ProjectFoldersController extends $Notifier<List<String>> {
  List<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element as $ClassProviderElement<AnyNotifier<List<String>, List<String>>, List<String>, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
