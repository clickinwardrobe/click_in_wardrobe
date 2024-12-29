import 'package:click_in_wardrobe/model/measurement.dart';
import 'package:click_in_wardrobe/model/unit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Should accurately convert millimetre value to', () {
    late Measurement asMillis;

    setUp(() {
      asMillis = Measurement(
          displayName: "test_measurement",
          valueAsMillis: 500,
          unit: Unit.millimeters);
    });

    test('inches given a normal value', () {
      const double expectedInches = 19.685;
      final double actual = asMillis.convertTo(Unit.inches);

      expect(actual, expectedInches);
    });

    test('inches given 0', () {
      final Measurement asMillis = Measurement(
          displayName: "shadowing asMillis so it can be 0",
          valueAsMillis: 0,
          unit: Unit.millimeters);
      const double expectedInches = 0;
      final double actual = asMillis.convertTo(Unit.inches);

      expect(actual, expectedInches);
    });
  });
}
