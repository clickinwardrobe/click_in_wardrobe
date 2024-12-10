import 'package:click_in_wardrobe/model/measurement.dart';
import 'package:click_in_wardrobe/widgets/measurement_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final Set<Measurement> _measurements = <Measurement>{
    Measurement(value: 38.0, displayName: "Chest"),
    Measurement(value: 39.5, displayName: "Waist"),
    Measurement(value: 42.0, displayName: "Hips"),
    Measurement(value: 27.0, displayName: "Leg Length"),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First route'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _measurements.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return MeasurementWidget(measurement: _measurements.elementAt(index));
          },
        ),
      ),
    );
  }
}
