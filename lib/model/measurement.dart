import 'package:click_in_wardrobe/model/unit.dart';
import 'package:flutter/widgets.dart';

/// Represents a measurement of either a person or an item of clothing
///
/// This class extends [ChangeNotifier], the only functions which
/// call [notifyListeners] are setters, unless otherwise indicated
class Measurement extends ChangeNotifier {
  /// The value of the measurement stored as millimetres
  final double valueAsMillis;
  /// For displaying the measurement in a UI, for example "Leg Length"
  final String displayName;

  Unit _unit;

  Unit get unit => _unit;

  /// Set unit, this function calls [notifyListeners]
  set unit(Unit value) {
    _unit = value;

    notifyListeners();
  }

  /// The value of this measurement in the current [unit]
  ///
  /// For converting to other units, see [convertTo]
  double get value {
    return unit.convertFromMillimeters(valueAsMillis);
  }

  Measurement(
      {required this.valueAsMillis,
      required this.displayName,
      required Unit unit})
      : _unit = unit;

  /// Pure function to return the value of this measurement if it was stored
  /// as the [newUnit]
  double convertTo(final Unit newUnit) {
    if (newUnit == unit) {
      return value;
    } else {
      return newUnit.convertFromMillimeters(value);
    }
  }
}
