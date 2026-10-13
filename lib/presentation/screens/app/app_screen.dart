import 'package:flutter/material.dart';

import '../../../utils/size_utils.dart';

class AppScreen extends StatelessWidget {
  final Widget child;
  final double? padding;
  final Widget? floatingActionButton;

  const AppScreen({
    super.key,
    required this.child,
    this.padding,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.surfaceColor,
      // backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(padding ?? SizeUtils.size32),
          child: child,
        ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
