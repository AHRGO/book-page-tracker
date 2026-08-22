import 'package:book_page_tracker/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/progress_tracker_model.dart';
import '../../widgets/delete_trackers_button.dart';
import 'app_screen.dart';
import '../../widgets/progress_tracker_widget.dart';
import '../bloc/progress_tracker_bloc.dart';
import 'create_tracker/create_tracker_screen.dart';

class ProgressTrackersScreen extends StatelessWidget {
  final List<ProgressTrackerModel> progressTrackerList;

  const ProgressTrackersScreen({super.key, required this.progressTrackerList});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProgressTrackerBloc>();

    return AppScreen(
      padding: SizeUtils.size0,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        shape: CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: SizeUtils.size32),
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
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 16.0,
          children: [
            SizedBox(height: SizeUtils.size16),
            ...progressTrackerList.map((e) => ProgressTrackerWidget(progressTracker: e)),
            SizedBox(height: SizeUtils.size16),
            DeleteTrackersButton(bloc: bloc),
          ],
        ),
      ),
    );
  }
}
