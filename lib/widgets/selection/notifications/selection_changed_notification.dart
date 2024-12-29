import 'package:flutter/widgets.dart';

/// Indicates that a new widget has been selected as part of a multi-select widget
///
/// [T] the new widget that has been selected
class SelectionChangedNotification<T extends Widget> extends Notification {
  final T newSelection;

  const SelectionChangedNotification({required this.newSelection});
}
