import 'package:click_in_wardrobe/model/unit.dart';

class Measurement {
  double valueAsMillis;
  final String displayName;

  Measurement({required this.valueAsMillis, required this.displayName});

  double convertTo(final Unit newUnit) {
    if (newUnit == Unit.millimeters) {
      return valueAsMillis;
    } else {
      return newUnit.convertFromMillimeters(valueAsMillis);
    }
  }
}
