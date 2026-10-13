import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/progress_tracker_bloc.dart';
import '../screens/create_tracker/create_tracker_screen.dart';

class CreateTrackerButton extends StatelessWidget {
  final ProgressTrackerBloc bloc;
  final VoidCallback? onPressed;

  const CreateTrackerButton({
    super.key,
    required this.bloc,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      // onPressed: onPressed,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: bloc,
              child: const CreateTrackerScreen(),
            ),
          ),
        );
      },
      label: const Text('Create a new tracker'),
      icon: Icon(Icons.add),
      iconAlignment: IconAlignment.end,
    );
  }
}
