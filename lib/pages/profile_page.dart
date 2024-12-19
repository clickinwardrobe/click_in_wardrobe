import 'package:click_in_wardrobe/model/measurement.dart';
import 'package:click_in_wardrobe/model/unit.dart';
import 'package:click_in_wardrobe/widgets/measurement_widget.dart';
import 'package:click_in_wardrobe/widgets/single_select_buttons.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final Set<Measurement> _measurements = <Measurement>{
    const Measurement(value: 38.0, unit: Unit.centimeters, displayName: "Chest"),
    const Measurement(value: 39.5, unit: Unit.centimeters, displayName: "Waist"),
    const Measurement(value: 42.0, unit: Unit.centimeters, displayName: "Hips"),
    const Measurement(value: 27.0, unit: Unit.centimeters, displayName: "Leg Length"),
  };

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListView.builder(
        itemCount: _measurements.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return MeasurementWidget(measurement: _measurements.elementAt(index));
        },
      ),
      SingleSelectButtonsWidget(
          direction: Axis.horizontal,
          widgetStatusMapSupplier: () {
            return {
              const Text("inches"): false,
              const Text("centimetres"): true,
              const Text("millimetres"): false
            };
          })
    ]);
  }
}
