import 'package:click_in_wardrobe/math/double_extensions.dart';

/// A unit of measurement, for example a centimetre.
enum Unit {
  centimeters(
      convertFromMillimeters: UnitConversions.centimetersFromMillimeters),
  millimeters(convertFromMillimeters: UnitConversions.identity),
  inches(convertFromMillimeters: UnitConversions.inchesFromMillimeters);

  const Unit({required convertFromMillimeters})
      : _convertFromMillimeters = convertFromMillimeters;

  final double Function(double) _convertFromMillimeters;

  /// Convenience method to convert a value in millimetres to the current unit
  double convertFromMillimeters(final double millis) {
    return _convertFromMillimeters.call(millis);
  }
}

class UnitConversions {
  static double inchesFromMillimeters(final double millis) =>
      (millis / 25.4).toDoubleAsFixed(3);

  static double centimetersFromMillimeters(final double millis) =>
      (millis / 10).toDoubleAsFixed(3);

  static double identity(final double millis) => millis;
}
