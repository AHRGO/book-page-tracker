import 'package:book_page_tracker/shared/app_colors.dart';
import 'package:flutter/material.dart';

class NoProgressTrackerWidget extends StatelessWidget {
  const NoProgressTrackerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.outlineColor.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle,
      ),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Add a progress tracker', style: TextStyle(color: AppColors.onSurfaceColor.withValues(alpha: 0.8))),
          Icon(Icons.plus_one_outlined, size: 100, color: AppColors.onSurfaceColor.withValues(alpha: 0.8), fontWeight: FontWeight.w300),
        ],
      ),
    );
  }
}
