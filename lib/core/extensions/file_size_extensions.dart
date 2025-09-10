import 'package:proper_filesize/proper_filesize.dart';

extension BigIntFileSizeExtensions on BigInt {
  String get displayString {
    final bytes = toInt();
    return bytes.displayString;
  }
}

extension IterableBigIntFileSizeExtensions on Iterable<BigInt> {
  String get displayString {
    final bytes = reduce((a, b) => a + b);
    return bytes.displayString;
  }
}

extension IntFileSizeExtensions on int {
  String get displayString => FileSize.fromBytes(this).toString(
    unit: Unit.auto(size: this, baseType: BaseType.metric),
    decimals: 2,
  );
}
