import 'package:dev_sweeper/core/extensions/file_size_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('BigIntFileSizeExtensions', () {
    expect(BigInt.from(0).displayString, '0 B');
    expect(BigInt.from(338348932).displayString, '338.35 MB');
    expect(BigInt.from(103365048).displayString, '103.37 MB');
    expect(BigInt.from(77934848).displayString, '77.93 MB');
    expect(BigInt.from(103365047).displayString, '103.37 MB');
  });

  test('IterableBigIntFileSizeExtensions', () {
    expect(
      [
        BigInt.from(0),
      ].displayString,
      '0 B',
    );
    expect(
      [
        BigInt.from(338348932),
        BigInt.from(103365048),
        BigInt.from(77934848),
        BigInt.from(103365047),
      ].displayString,
      '623.01 MB',
    );
  });
}
