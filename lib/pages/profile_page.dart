import 'package:click_in_wardrobe/model/measurement.dart';
import 'package:click_in_wardrobe/model/unit.dart';
import 'package:click_in_wardrobe/widgets/measurement_widget/measurement_list.dart';
import 'package:click_in_wardrobe/widgets/selection/notifications/selection_changed_notification.dart';
import 'package:click_in_wardrobe/widgets/selection/single_selection/single_selection_widget.dart';
import 'package:click_in_wardrobe/widgets/unit_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _measurements = ValueNotifier<Set<Measurement>>({
    Measurement(
        unit: Unit.centimeters, valueAsMillis: 380.0, displayName: "Chest"),
    Measurement(
        unit: Unit.centimeters, valueAsMillis: 390.5, displayName: "Waist"),
    Measurement(
        unit: Unit.centimeters, valueAsMillis: 420.0, displayName: "Hips"),
    Measurement(
        unit: Unit.centimeters,
        valueAsMillis: 270.0,
        displayName: "Leg Length"),
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ValueListenableBuilder(
        valueListenable: _measurements,
        builder: (context, value, widget) {
          return MeasurementList(
            measurements: value,
          );
        },
      ),
      NotificationListener<SelectionChangedNotification<UnitWidget>>(
          child: SingleSelectionWidget(
            widgetMap: _widgetStatusMapSupplier(),
            direction: Axis.horizontal,
          ),
          onNotification: (notification) {
            _changeMeasurementUnitCallback(notification.newSelection);

            return true;
          }),
    ]);
  }

  /// This is a bit of a hack because the value in the notifier is a set, updating the contents of that
  /// set doesn't count as an update, so we just swap it out with the modified set
  void _changeMeasurementUnitCallback(UnitWidget selectedWidget) {
    final Unit selectedUnit = selectedWidget.unit;
    final Set<Measurement> newSet = <Measurement>{};

    for (Measurement measurement in _measurements.value) {
      measurement.unit = selectedUnit;
      newSet.add(measurement);
    }

    _measurements.value = newSet;
  }

  Map<UnitWidget, bool> _widgetStatusMapSupplier() {
    return {
      const UnitWidget(unit: Unit.inches): false,
      const UnitWidget(unit: Unit.centimeters): true,
      const UnitWidget(unit: Unit.millimeters): false,
    };
  }
}
