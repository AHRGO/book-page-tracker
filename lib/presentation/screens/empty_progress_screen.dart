import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/app_colors.dart';
import '../../utils/size_utils.dart';
import '../../widgets/create_tracker_button.dart';
import 'app_screen.dart';
import '../bloc/progress_tracker_bloc.dart';
// import 'create_tracker/create_tracker_screen.dart';

class EmptyProgressScreen extends StatelessWidget {
  const EmptyProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProgressTrackerBloc>();

    return AppScreen(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _NoProgressMessage(),
            CreateTrackerButton(bloc: bloc),
            // FilledButton.icon(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => BlocProvider.value(
            //           value: bloc,
            //           child: const CreateTrackerScreen(),
            //         ),
            //       ),
            //     );
            //   },
            //   icon: const Icon(Icons.add),
            //   label: const Text('Add tracker'),
            // ),
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
    final titleStyle = theme.textTheme.titleLarge?.copyWith(color: AppColors.onSurfaceColor);

    return Container(
      color: AppColors.disabledColor,
      padding: EdgeInsets.all(SizeUtils.size16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Oops, it seems you haven\'t added any progress tracker yet.', style: titleStyle),
          SizedBox(height: SizeUtils.size32),
          Text('Tap the button  bellow to add your first progress tracker!', style: titleStyle),
        ],
      ),
    );
  }
}
