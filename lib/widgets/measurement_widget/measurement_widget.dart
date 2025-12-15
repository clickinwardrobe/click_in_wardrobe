import 'package:click_in_wardrobe/const/app_colors.dart';
import 'package:click_in_wardrobe/model/measurement.dart';
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
    final TextStyle textStyle = TextStyle(
        color: AppColors.textColor.get(),
        decoration: TextDecoration.none,
        fontSize: 25
    );

    return Row(
      children: [
        Text(widget.measurement.displayName, style: textStyle),
        Text(" : ", style: textStyle),
        Text(widget.measurement.value.toString(), style: textStyle),
      ],
    );
  }
}
