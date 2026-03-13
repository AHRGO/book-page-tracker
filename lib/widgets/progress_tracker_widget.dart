import 'package:book_page_tracker/enum/progress_colors_enum.dart';
import 'package:book_page_tracker/models/page_tracker_model.dart';
import 'package:book_page_tracker/shared/app_colors.dart';
import 'package:book_page_tracker/widgets/simple_card.dart';
import 'package:flutter/material.dart';

class ProgressTrackerWidget extends StatelessWidget {
  final PageTrackerModel progressTracker;
  // final Color progressColor;

  const ProgressTrackerWidget({
    super.key,
    // required this.progressColor,
    required this.progressTracker,
  });

  @override
  Widget build(BuildContext context) {
    final double percentual = (progressTracker.totalPages <= 0 ? 0.0 : (progressTracker.actualPage / progressTracker.actualPage)).clamp(
      0.0,
      1.0,
    );

    return Expanded(
      child: SimpleCard(
        height: 160,
        child: Align(
          alignment: Alignment.center,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 116,
                  height: 116,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned.fill(
                        child: CircularProgressIndicator(
                          value: percentual,
                          strokeWidth: 20,
                          color: ProgressColorsEnum.fromProgress(progressTracker.progress).getProgressColor(),
                          backgroundColor: AppColors.outlineColor,
                        ),
                      ),
                      Text(
                        percentual.toString(),
                        style: const TextStyle(fontSize: 65, fontWeight: FontWeight.bold, color: AppColors.neutrals50),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 18),
                Text(
                  progressTracker.bookName,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.neutrals50),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
