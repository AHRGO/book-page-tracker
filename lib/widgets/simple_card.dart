import 'package:book_page_tracker/shared/padding_constants.dart';
import 'package:flutter/material.dart';

class SimpleCard extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final bool hasShadow;
  final Widget child;

  const SimpleCard({super.key, this.height, this.width, this.backgroundColor, this.hasShadow = false, required this.child});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(24),
        // boxShadow: hasShadow,
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            PaddingConstants.large,
            PaddingConstants.medium,
            PaddingConstants.small,
            PaddingConstants.medium,
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: PaddingConstants.medium),
            child: Align(
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(controller: scrollController, child: child),
            ),
          ),
        ),
      ),
    );
  }
}
