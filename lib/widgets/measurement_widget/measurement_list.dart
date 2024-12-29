import 'package:click_in_wardrobe/model/measurement.dart';
import 'package:click_in_wardrobe/widgets/measurement_widget/measurement_widget.dart';
import 'package:flutter/material.dart';

class MeasurementList extends StatefulWidget {
  final Set<Measurement> measurements;

  const MeasurementList({super.key, required this.measurements});

  @override
  State<StatefulWidget> createState() => _MeasurementListState();
}

class _MeasurementListState extends State<MeasurementList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.measurements.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return MeasurementWidget(
            measurement: widget.measurements.elementAt(index));
      },
    );
  }
}
