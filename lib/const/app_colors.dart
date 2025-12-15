import 'dart:ui';

enum AppColors {
  textColor(color: Color.fromRGBO(130, 174, 245, 1.0));

  final Color color;

  const AppColors({
    required this.color,
  });

  Color get() => color;
}
