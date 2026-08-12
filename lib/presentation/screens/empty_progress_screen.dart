import 'package:flutter/material.dart';

import '../../utils/app_colors_local.dart';
import '../../utils/logger.dart';
import '../../utils/paddings.dart';
import 'create_tracker_screen.dart';

class EmptyProgressScreen extends StatelessWidget {
  const EmptyProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Paddings.p64),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _NoProgressMessage(),
            FilledButton.icon(
              onPressed: () {
                //todo: navigate to track creation screen
                Logger.logWarning('You\'ve pressed the button!');
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateTrackerScreen()));
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
    final titleStyle = theme.textTheme.titleLarge?.copyWith(color: AppColorsLocal.onSurfaceColor);

    return Container(
      color: AppColorsLocal.disabledColor,
      padding: EdgeInsets.all(Paddings.p16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // SizedBox(height: 64.0),
          Text('Oops, it seems you haven\'t added any progress tracker yet.', style: titleStyle),
          SizedBox(height: 32.0),
          Text('Tap the button  bellow to add your first progress tracker!', style: titleStyle),
        ],
      ),
    );
  }
}
