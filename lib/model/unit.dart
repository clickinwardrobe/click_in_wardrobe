enum Unit {
  centimeters(convertFromCentimeters: _Conversions.centimetresFromCentimeters),
  millimeters(convertFromCentimeters: _Conversions.millimetresFromCentimeters),
  inches(convertFromCentimeters: _Conversions.inchesFromCentimeters);

  const Unit({
    required this.convertFromCentimeters
  });

  final Function(double) convertFromCentimeters;
}

class _Conversions {
  static double inchesFromCentimeters(double centimetres) => centimetres / 2.54;

  static double millimetresFromCentimeters(double centimetres) => centimetres * 10;

  static double centimetresFromCentimeters(double centimetres) => centimetres;
}

