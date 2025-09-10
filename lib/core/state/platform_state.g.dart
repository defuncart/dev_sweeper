// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlatformController)
const platformControllerProvider = PlatformControllerProvider._();

final class PlatformControllerProvider extends $NotifierProvider<PlatformController, SupportedPlatform> {
  const PlatformControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'platformControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$platformControllerHash();

  @$internal
  @override
  PlatformController create() => PlatformController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupportedPlatform value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupportedPlatform>(value),
    );
  }
}

String _$platformControllerHash() => r'0f4a376a91fd778b7bb9a9282bbd640c79d6e584';

abstract class _$PlatformController extends $Notifier<SupportedPlatform> {
  SupportedPlatform build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SupportedPlatform, SupportedPlatform>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SupportedPlatform, SupportedPlatform>,
              SupportedPlatform,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
