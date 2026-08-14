import 'package:flutter/material.dart';

import '../utils/size_utils.dart';

class AppScreen extends StatelessWidget {
  final Widget child;

  const AppScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.surfaceColor,
      // backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(SizeUtils.size32),
          child: child,
        ),
      ),
    );
  }
}
