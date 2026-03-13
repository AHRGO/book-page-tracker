import 'package:flutter/material.dart';

class PaddingConstants {
  static const double zero = 0;
  static const double extraSmall = 4.0;
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  static const double extraLarge = 32.0;
}

enum PaddingSide {
  all,
  horizontal,
  vertical,
  top,
  topRight,
  topLeft,
  topHorizontal,
  bottom,
  bottomRight,
  bottomLeft,
  bottomHorizontal,
  left,
  leftVertical,
  right,
  rightVertical,
  none,
}

enum PaddingSize {
  extraSmall(PaddingConstants.extraSmall),
  small(PaddingConstants.small),
  medium(PaddingConstants.medium),
  large(PaddingConstants.large),
  extraLarge(PaddingConstants.extraLarge);

  final double size;
  const PaddingSize(this.size);

  EdgeInsets paddingFromSide(PaddingSide side) {
    switch (side) {
      case PaddingSide.all:
        return EdgeInsets.all(size);
      case PaddingSide.top:
        return EdgeInsets.only(top: size);
      case PaddingSide.bottom:
        return EdgeInsets.only(bottom: size);
      case PaddingSide.left:
        return EdgeInsets.only(left: size);
      case PaddingSide.right:
        return EdgeInsets.only(right: size);
      case PaddingSide.horizontal:
        return EdgeInsets.symmetric(horizontal: size);
      case PaddingSide.vertical:
        return EdgeInsets.symmetric(vertical: size);
      case PaddingSide.topRight:
        return EdgeInsets.only(top: size, right: size);
      case PaddingSide.topLeft:
        return EdgeInsets.only(top: size, left: size);
      case PaddingSide.bottomRight:
        return EdgeInsets.only(bottom: size, right: size);
      case PaddingSide.bottomLeft:
        return EdgeInsets.only(bottom: size, left: size);
      case PaddingSide.topHorizontal:
        return EdgeInsets.only(top: size, left: size, right: size);
      case PaddingSide.bottomHorizontal:
        return EdgeInsets.only(bottom: size, left: size, right: size);
      case PaddingSide.leftVertical:
        return EdgeInsets.only(left: size, top: size, bottom: size);
      case PaddingSide.rightVertical:
        return EdgeInsets.only(right: size, top: size, bottom: size);
      default:
        return EdgeInsets.zero;
    }
  }
}

// coverage:ignore-start
class AppPadding extends StatelessWidget {
  const AppPadding({super.key, this.child, this.paddingSize = PaddingSize.small, this.paddingSide = PaddingSide.all});

  final Widget? child;
  final PaddingSize paddingSize;
  final PaddingSide paddingSide;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: paddingSize.paddingFromSide(paddingSide), child: child);
  }
}

// coverage:ignore-end
