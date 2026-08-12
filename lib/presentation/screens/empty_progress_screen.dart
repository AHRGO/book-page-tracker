import 'package:book_page_tracker/shared/app_colors.dart';
import 'package:flutter/material.dart';

class EmptyProgressScreen extends StatelessWidget {
  const EmptyProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.titleLarge?.copyWith(
      color: AppColors.onSurfaceColor,
    );
    return SizedBox(
      child: Column(
        children: [
          SizedBox(height: 64.0),
          Text(
            'Oops, it seems you haven\'t added any progress tracker yet.',
            style: titleStyle,
          ),
          SizedBox(height: 32.0),
          Text(
            'Tap the button  bellow to add your first progress tracker!',
            style: titleStyle,
          ),
        ],
      ),
    );
  }
}
