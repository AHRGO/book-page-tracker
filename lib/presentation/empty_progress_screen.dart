import 'package:book_page_tracker/shared/app_colors.dart';
import 'package:book_page_tracker/widgets/empty_progress_widget.dart';
import 'package:flutter/material.dart';

class EmptyProgressScreen extends StatelessWidget {
  const EmptyProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.titleLarge?.copyWith(
      color: AppColors.onSurfaceColor,
    );
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 72.0,
        children: [
          const _TutorialTextColumn(),
          const EmptyProgressWidget(),
        ],
      ),
    );
  }
}

class _TutorialTextColumn extends StatelessWidget {
  const _TutorialTextColumn();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.titleLarge?.copyWith(
      color: AppColors.onSurfaceColor,
    );

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 32.0,
      children: [
        Text(
          'Oops, it seems you haven\'t added any progress tracker yet.',
          style: titleStyle,
        ),
        Text(
          'Tap the button  bellow to add your first progress tracker!',
          style: titleStyle,
        ),
      ],
    );
  }
}
