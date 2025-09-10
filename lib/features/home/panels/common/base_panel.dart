import 'package:dev_sweeper/core/widgets/adaptive_spinner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasePanel<T> extends StatelessWidget {
  const BasePanel({
    super.key,
    required this.state,
    required this.onData,
  });

  final AsyncValue<T> state;
  final Widget Function(T) onData;

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      AsyncLoading() => const Center(child: AdaptiveSpinner()),
      AsyncError(:final error) => Center(child: Text(error.toString())),
      AsyncData(:final value) => onData(value),
    };
  }
}
