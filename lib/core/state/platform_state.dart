import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'platform_state.g.dart';

enum SupportedPlatform { macOS, linux }

@Riverpod(keepAlive: true)
class PlatformController extends _$PlatformController {
  @override
  SupportedPlatform build() => switch (defaultTargetPlatform) {
    TargetPlatform.linux => SupportedPlatform.linux,
    TargetPlatform.macOS => SupportedPlatform.macOS,
    _ => throw ArgumentError('Unsupported platform'),
  };

  void set(SupportedPlatform platform) {
    if (kDebugMode) {
      state = platform;
    }
  }
}
