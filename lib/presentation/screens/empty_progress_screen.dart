import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/logger_utils.dart';
import '../../utils/size_utils.dart';
import '../../widgets/app_screen.dart';
import 'create_tracker/create_tracker_screen.dart';

class EmptyProgressScreen extends StatelessWidget {
  const EmptyProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _NoProgressMessage(),
            FilledButton.icon(
              onPressed: () {
                //todo: navigate to track creation screen
                LoggerUtils.logWarning(
                  'You\'ve pressed the button!',
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const CreateTrackerScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('Add tracker'),
            ),
          ],
        ),
      ),
    );
  }
}

class _NoProgressMessage extends StatelessWidget {
  const _NoProgressMessage();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.titleLarge?.copyWith(
      color: AppColors.onSurfaceColor,
    );

    return Container(
      color: AppColors.disabledColor,
      padding: EdgeInsets.all(SizeUtils.size16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // SizedBox(height: 64.0),
          Text(
            'Oops, it seems you haven\'t added any progress tracker yet.',
            style: titleStyle,
          ),
          SizedBox(height: SizeUtils.size32),
          Text(
            'Tap the button  bellow to add your first progress tracker!',
            style: titleStyle,
          ),
        ],
      ),
    );
  }
}
