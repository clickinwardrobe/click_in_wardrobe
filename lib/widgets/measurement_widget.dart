import 'package:click_in_wardrobe/model/measurement.dart';
import 'package:click_in_wardrobe/model/unit.dart';
import 'package:flutter/material.dart';

class MeasurementWidget extends StatefulWidget {
  final Measurement measurement;

  const MeasurementWidget({super.key, required this.measurement});

  @override
  State<MeasurementWidget> createState() => _MeasurementWidgetState();
}

class _MeasurementWidgetState extends State<MeasurementWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.measurement.displayName),
        const Text(" : "),
        Text(widget.measurement.value.toString()),
      ],
    );
  }

  void convertTo(final Unit unit) {
    final double valueAsMillis = widget.measurement.convertTo(unit);

    setState(() {
        widget.measurement.value = valueAsMillis;
    });
  }
}
