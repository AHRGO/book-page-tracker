import 'dart:ui';

import 'package:book_page_tracker/shared/color_pallete.dart';

class ProgressColors {
  static const progress5 = ColorPallete.red15;
  static const progress10 = ColorPallete.red20;
  static const progress20 = ColorPallete.red35;
  static const progress30 = ColorPallete.red40;
  static const progress40 = ColorPallete.yellow40;
  static const progress50 = ColorPallete.yellow60;
  static const progress60 = ColorPallete.green30;
  static const progress70 = ColorPallete.green35;
  static const progress80 = ColorPallete.green40;
  static const progress90 = ColorPallete.blue30;
  static const progress95 = ColorPallete.blue40;
  static const progress100 = ColorPallete.blue50;
  static const progressUndefined = ColorPallete.darkGray50;

  static Color getProgressColor(double progressRate) {
    if (progressRate <= 0.05) {
      return progress5;
    } else if (progressRate > 0.05 && progressRate <= 0.10) {
      return progress10;
    } else if (progressRate > 0.10 && progressRate <= 0.20) {
      return progress20;
    } else if (progressRate > 0.20 && progressRate <= 0.30) {
      return progress30;
    } else if (progressRate > 0.30 && progressRate <= 0.40) {
      return progress40;
    } else if (progressRate > 0.40 && progressRate <= 0.50) {
      return progress50;
    } else if (progressRate > 0.50 && progressRate <= 0.60) {
      return progress60;
    } else if (progressRate > 0.60 && progressRate <= 0.70) {
      return progress70;
    } else if (progressRate > 0.70 && progressRate <= 0.80) {
      return progress80;
    } else if (progressRate > 0.80 && progressRate <= 0.90) {
      return progress90;
    } else if (progressRate > 0.90 && progressRate <= 0.95) {
      return progress95;
    } else if (progressRate > 0.95 && progressRate <= 1.00) {
      return progress100;
    } else {
      return progressUndefined; // Default color for out-of-range values
    }
  }
}
