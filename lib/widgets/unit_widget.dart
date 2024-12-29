import 'package:click_in_wardrobe/model/unit.dart';
import 'package:flutter/material.dart';

class UnitWidget extends StatelessWidget {
  final Unit unit;

  const UnitWidget({required this.unit});

  @override
  Widget build(BuildContext context) {
    return Text(unit.name);
  }
}
