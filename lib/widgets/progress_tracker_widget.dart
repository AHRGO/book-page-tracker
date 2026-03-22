import 'package:book_page_tracker/models/page_tracker_model.dart';
import 'package:book_page_tracker/shared/app_colors.dart';
import 'package:book_page_tracker/utils/progress_colors.dart';
import 'package:flutter/material.dart';

class ProgressTrackerWidget extends StatelessWidget {
  final PageTrackerModel progressTracker;

  const ProgressTrackerWidget({
    super.key,
    required this.progressTracker,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _PagesRead(
              progressRate: progressTracker.progress,
            ),
            Expanded(
              child: _BookInformation(
                pageTracker: progressTracker,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PagesRead extends StatelessWidget {
  final double progressRate;
  final double size;

  const _PagesRead({
    required this.progressRate,
    this.size = 75.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 32.0),
      child: SizedBox(
        height: size,
        width: size,
        child: Stack(
          children: [
            Positioned.fill(
              child: CircularProgressIndicator(
                value: progressRate,
                backgroundColor: AppColors.outlineColor,
                color: ProgressColors.getProgressColor(progressRate),
                strokeWidth: 10,
              ),
            ),
            Align(
              alignment: AlignmentGeometry.center,
              child: Text(
                ' ${(progressRate * 100).toStringAsFixed(2)}%',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.onSurfaceColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BookInformation extends StatelessWidget {
  final PageTrackerModel pageTracker;

  const _BookInformation({required this.pageTracker});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            pageTracker.bookName,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 16.0),
          Text(
            '${pageTracker.actualPage}/${pageTracker.totalPages}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.disabledColor,
            ),
          ),
        ],
      ),
    );
  }
}
