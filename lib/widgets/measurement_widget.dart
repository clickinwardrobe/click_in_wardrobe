import 'package:click_in_wardrobe/model/measurement.dart';
import 'package:flutter/material.dart';

class MeasurementWidget extends StatelessWidget {
  final Measurement measurement;

  const MeasurementWidget({super.key, required this.measurement});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(measurement.displayName),
        Text(" : "),
        Text(measurement.value.toString()),
      ],
    );
  }
}
