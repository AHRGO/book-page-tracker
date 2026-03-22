import 'package:book_page_tracker/shared/app_colors.dart';
import 'package:flutter/material.dart';

class NoProgressTrackerPlaceholderWidget extends StatelessWidget {
  const NoProgressTrackerPlaceholderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.disabledColor,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(16.0),
      //   side: BorderSide(
      //     color: AppColors.outlineColor,
      //     width: 2.0,
      //     style: BorderStyle.solid,
      //   ),
      // ),
      // shape: RoundedRectangleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('Yolo'),
          ],
        ),
      ),
    );
  }
}
