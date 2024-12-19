import 'package:click_in_wardrobe/functional_interfaces.dart';
import 'package:flutter/material.dart';

typedef WidgetStatusMap<X> = Map<X, bool>;

class SingleSelectButtonsWidget<T extends Widget> extends StatefulWidget {
  final Axis direction;
  final Supplier<Map<T, bool>> widgetStatusMapSupplier;

  late final Map<T, bool> widgetStatusMap;

  SingleSelectButtonsWidget(
      {super.key,
      required this.direction,
      required this.widgetStatusMapSupplier}) {
    this.widgetStatusMap = this.widgetStatusMapSupplier.call();
  }

  @override
  State<StatefulWidget> createState() => _SingleSelectButtonsWidgetState<T>();
}

class _SingleSelectButtonsWidgetState<T extends Widget>
    extends State<SingleSelectButtonsWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: ToggleButtons(
      direction: widget.direction,
      onPressed: (final int index) {
        setState(() {
          _setOnlyIndexSelected(index);
        });
      },
      isSelected: widget.widgetStatusMap.values.toList(),
      children: widget.widgetStatusMap.keys.toList(),
    ));
  }

  T _getWidgetAtIndex(final int index) {
    return widget.widgetStatusMap.keys.elementAt(index);
  }

  void _setOnlyIndexSelected(final int index) {
    final T widgetAtIndex = _getWidgetAtIndex(index);

    _disableAllWidgets(widget.widgetStatusMap);

    widget.widgetStatusMap[widgetAtIndex] = true;
  }

  void _disableAllWidgets(final Map<T, bool> widgetStatusMap) {
    for (int i = 0; i < widget.widgetStatusMap.length; i++) {
      final T currentWidget = _getWidgetAtIndex(i);

      widget.widgetStatusMap[currentWidget] = false;
    }
  }
}
