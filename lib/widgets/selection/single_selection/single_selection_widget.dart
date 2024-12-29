import 'package:click_in_wardrobe/exceptions/illegal_state_exception.dart';
import 'package:click_in_wardrobe/widgets/selection/notifications/selection_changed_notification.dart';
import 'package:flutter/material.dart';

/// Re-usable widget to wrap multiple widgets which can be selected
///
/// At least one widget must be selected at all times
class SingleSelectionWidget<T extends Widget> extends StatefulWidget {
  /// The direction the widget should display
  final Axis direction;

  /// A map containing the widgets to display and whether or not they are selected
  ///
  /// See the comment on the constructor regarding simultaneous selections
  final Map<T, bool> widgetMap;

  /// This widget does not support managing the state of multiple selections at once.
  /// You may have two widgets be selected initially, but only one [SelectionChangedNotification]
  /// will be sent. When the user selects an item only their new selection will be selected.
  ///
  /// Managing multiple selections is not officially supported and may be rendered impossible
  /// in future versions.
  const SingleSelectionWidget(
      {super.key, required this.direction, required this.widgetMap});

  @override
  State<StatefulWidget> createState() => _SingleSelectionWidgetState<T>();

  /// Return the widget currently selected.
  ///
  /// This function may throw an [IllegalStateException] if, for whatever reason, it can't
  /// find a selected widget. It is probably a good idea to explicitly handle this
  T getCurrentlySelectedWidget() {
    for (final widgetMapEntry in widgetMap.entries) {
      if (widgetMapEntry.value) {
        return widgetMapEntry.key;
      }
    }

    throw const IllegalStateException(
        cause: "No widget selected in selection widget");
  }
}

class _SingleSelectionWidgetState<T extends Widget>
    extends State<SingleSelectionWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ToggleButtons(
          direction: widget.direction,
          selectedColor: Colors.red,
          onPressed: _widgetClickedHandler,
          isSelected: widget.widgetMap.values.toList(),
          children: widget.widgetMap.keys.toList()),
    );
  }

  /// Set the state of this widget to only contain the now selected widget
  ///
  /// This also dispatches a [SelectionChangedNotification] with the
  /// currently selected widget attached
  void _widgetClickedHandler(final int index) {
    setState(() {
      _setOnlyIndexSelected(index);
    });

    SelectionChangedNotification(
            newSelection: widget.getCurrentlySelectedWidget())
        .dispatch(context);
  }

  /// Unselect all widgets except the one denoted at [index] in the widgetMap
  /// contained in [widget]
  void _setOnlyIndexSelected(final int index) {
    final T widgetAtIndex = _getWidgetAtIndex(index);

    _deselectAllWidgets();

    widget.widgetMap[widgetAtIndex] = true;
  }

  /// Get the widget at the given index via the widgetMap's keys
  T _getWidgetAtIndex(final int index) {
    return widget.widgetMap.keys.elementAt(index);
  }

  /// Deselect all the widgets by setting their value in the widgetmap to false
  void _deselectAllWidgets() {
    for (int i = 0; i < widget.widgetMap.length; i++) {
      final T currentWidget = _getWidgetAtIndex(i);

      widget.widgetMap[currentWidget] = false;
    }
  }
}
