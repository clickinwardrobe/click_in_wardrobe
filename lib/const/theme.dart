import 'dart:ui';

import 'package:click_in_wardrobe/const/app_colors.dart';

enum Themes {
  standard(theme: Theme(
      textColor: AppColors.textColor
  ));

  final Theme theme;

  const Themes({
    required this.theme,
  });
}

class Theme {
  final AppColors textColor;

  Theme({
    required this.textColor,
  });
}
