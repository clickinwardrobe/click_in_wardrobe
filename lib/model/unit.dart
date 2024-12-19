import 'package:click_in_wardrobe/functional_interfaces.dart';
import 'package:click_in_wardrobe/math/double_extensions.dart';

enum Unit {
  centimeters(
      convertFromMillimeters: UnitConversions.centimetersFromMillimeters),
  millimeters(convertFromMillimeters: FunctionUtils.identity),
  inches(convertFromMillimeters: UnitConversions.inchesFromMillimeters);

  const Unit({required this.convertFromMillimeters});

  final Function(double) convertFromMillimeters;
}

class UnitConversions {
  static double inchesFromMillimeters(final double millis) => (millis / 25.4).toDoubleAsFixed(3);

  static double centimetersFromMillimeters(final double millis) => (millis / 10).toDoubleAsFixed(3);
}
