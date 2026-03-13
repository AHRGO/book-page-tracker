import 'package:book_page_tracker/shared/padding_constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AppCardWidget extends StatelessWidget {
  const AppCardWidget({
    super.key,
    required this.child,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.all(PaddingConstants.large),
    this.minHeight,
    this.width,
    this.borderRadius = 16,
    this.maxHeight,
    this.color,
    this.onTap,
    @Deprecated('usar a propriedade color') this.segundaCor = false,
    @Deprecated('usar a propriedade color') this.terceiraCor = false,
    this.border,
    this.dashedBorder = false,
    this.alteraCursor = false,
    this.borderColor,
    this.borderRadiusTopLeft = true,
    this.borderRadiusBottomLeft = true,
    this.borderRadiusTopRight = true,
    this.borderRadiusBottomRigth = true,
    this.elevation = 0,
  });
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double? minHeight;
  final double? width;
  final double borderRadius;
  final Color? color;
  final double? maxHeight;
  final Function()? onTap;
  final bool borderRadiusTopLeft;
  final bool borderRadiusBottomLeft;
  final bool borderRadiusTopRight;
  final bool borderRadiusBottomRigth;
  final double elevation;

  ///Ele prefere a segunda cor a terceira
  @Deprecated('usar a propriedade color')
  final bool segundaCor;

  ///Ele prefere a segunda cor a terceira
  @Deprecated('usar a propriedade color')
  final bool terceiraCor;

  final BoxBorder? border;
  final bool dashedBorder;
  final bool alteraCursor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final Color cor = segundaCor
        ? Theme.of(context).colorScheme.surfaceContainerHigh
        : (terceiraCor ? Theme.of(context).colorScheme.surfaceContainerHigh : Theme.of(context).colorScheme.surfaceContainerHigh);
    if (dashedBorder) {
      return MouseRegion(
        cursor: (onTap != null || alteraCursor) ? SystemMouseCursors.click : SystemMouseCursors.basic,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(color: color ?? cor, borderRadius: BorderRadius.circular(borderRadius)),
            margin: margin,
            child: DottedBorder(
              options: RoundedRectDottedBorderOptions(
                radius: Radius.circular(borderRadius),
                strokeCap: StrokeCap.round,
                dashPattern: [10, 5],
                color: borderColor ?? Theme.of(context).textTheme.bodyMedium!.color!,
              ),
              child: Container(
                padding: padding,
                width: width ?? MediaQuery.of(context).size.width * 0.5,
                constraints: BoxConstraints(
                  minHeight: minHeight ?? MediaQuery.of(context).size.height * 0.3,
                  maxHeight: maxHeight ?? double.infinity,
                ),
                child: child,
              ),
            ),
          ),
        ),
      );
    }
    return MouseRegion(
      cursor: onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          elevation: elevation,
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadiusTopLeft ? borderRadius : 0),
            topRight: Radius.circular(borderRadiusTopRight ? borderRadius : 0),
            bottomLeft: Radius.circular(borderRadiusBottomLeft ? borderRadius : 0),
            bottomRight: Radius.circular(borderRadiusBottomRigth ? borderRadius : 0),
          ),
          child: Container(
            margin: margin,
            padding: padding,
            width: width ?? MediaQuery.of(context).size.width * 0.5,
            constraints: BoxConstraints(
              minHeight: minHeight ?? MediaQuery.of(context).size.height * 0.3,
              maxHeight: maxHeight ?? double.infinity,
            ),
            decoration: BoxDecoration(
              color: color ?? cor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadiusTopLeft ? borderRadius : 0),
                topRight: Radius.circular(borderRadiusTopRight ? borderRadius : 0),
                bottomLeft: Radius.circular(borderRadiusBottomLeft ? borderRadius : 0),
                bottomRight: Radius.circular(borderRadiusBottomRigth ? borderRadius : 0),
              ),
              border: border,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
