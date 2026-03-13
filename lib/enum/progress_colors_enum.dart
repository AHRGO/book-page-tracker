import 'dart:ui';

import 'package:book_page_tracker/shared/app_colors.dart';

enum ProgressColorsEnum {
  beginning,
  middle,
  overMiddle,
  finished
  ;

  const ProgressColorsEnum();

  static ProgressColorsEnum fromProgress(double progressRate) {
    if (progressRate <= 0.25) {
      return ProgressColorsEnum.beginning;
    } else if (progressRate > 0.25 && progressRate < 0.75) {
      return ProgressColorsEnum.middle;
    } else if (progressRate >= 0.75 && progressRate < 1.0) {
      return ProgressColorsEnum.overMiddle;
    } else {
      return ProgressColorsEnum.finished;
    }
  }

  Color getProgressColor() {
    switch (this) {
      case ProgressColorsEnum.beginning:
        return AppColors.red30;
      case ProgressColorsEnum.middle:
        return AppColors.yellow40;
      case ProgressColorsEnum.overMiddle:
        return AppColors.green30;
      case ProgressColorsEnum.finished:
        return AppColors.blue40;
    }
  }
}
