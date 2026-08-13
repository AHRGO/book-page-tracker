import 'package:book_page_tracker/shared/app_colors.dart';
import 'package:flutter/material.dart';

class EmptyProgressWidget extends StatelessWidget {
  const EmptyProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.titleLarge?.copyWith(
      color: AppColors.onSurfaceColor,
    );

    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: () => print('Botão foi apertado!'),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 12.0,
            children: [
              Text(
                'Add Progress Tracker',
                style: titleStyle,
              ),
              Icon(
                Icons.add_circle_outline_sharp,
                size: 32.0,
                color: AppColors.onSurfaceColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
