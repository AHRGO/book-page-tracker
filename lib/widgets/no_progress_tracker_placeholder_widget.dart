import 'package:book_page_tracker/shared/app_colors.dart';
import 'package:book_page_tracker/widgets/app_card_widget.dart';
import 'package:flutter/material.dart';

class NoProgressTrackerPlaceholderWidget extends StatelessWidget {
  const NoProgressTrackerPlaceholderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCardWidget(
      dashedBorder: true,
      color: Colors.transparent,
      borderColor: AppColors.surfaceColor,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.workspace_premium_outlined, size: 32.0, color: AppColors.surfaceColor),
            const SizedBox(width: 12.0),
            Text(
              'Tap to add a progress.',
              style: TextStyle(color: AppColors.surfaceColor, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
