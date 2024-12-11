import 'package:flutter/material.dart';

class UnitToggleSwitch extends StatefulWidget {
  final Color? activeColor;

  const UnitToggleSwitch({super.key, this.activeColor});

  @override
  State<UnitToggleSwitch> createState() => _UnitToggleSwitchState();
}

class _UnitToggleSwitchState extends State<UnitToggleSwitch> {
  static const Color defaultActiveColor = Colors.pink;
  static const Text defaultLabel = Text("Inches / CM");

  late final Color activeColor;

  bool isSet = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SwitchListTile(
        title: defaultLabel,
        value: isSet,
        activeColor: activeColor,
        onChanged: onChange,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    activeColor = widget.activeColor ?? defaultActiveColor;
  }

  void onChange(bool newValue) {
    setState(() {
      isSet = newValue;
    });
  }
}
