import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/size_utils.dart';
import '../../../widgets/app_screen.dart';
import '../../bloc/progress_tracker_bloc.dart';
import 'widgets/project_type_dropdown.dart';
import 'widgets/project_unity_dropdown.dart';

class CreateTrackerScreen extends StatefulWidget {
  const CreateTrackerScreen({super.key});

  @override
  State<CreateTrackerScreen> createState() => _CreateTrackerScreenState();
}

class _CreateTrackerScreenState extends State<CreateTrackerScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _projectNameController = TextEditingController();
  final TextEditingController _totalPositionsController = TextEditingController();
  final TextEditingController _currentPositionController = TextEditingController();

  String? _typeSelected;
  String? _unitySelected;

  @override
  void dispose() {
    _projectNameController.dispose();
    _totalPositionsController.dispose();
    _currentPositionController.dispose();
    super.dispose();
  }

  void _submit({required ProgressTrackerBloc bloc}) {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final projectName = _projectNameController.text;
    final totalPositions = int.parse(_totalPositionsController.text);
    final currentPosition = int.parse(_currentPositionController.text);

    bloc.add(
      AddProgressTracker(
        projectName: projectName,
        totalPositions: totalPositions,
        currentPosition: currentPosition,
        projectType: _typeSelected,
        trackingUnity: _unitySelected,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProgressTrackerBloc(),

      child: AppScreen(
        child: BlocConsumer<ProgressTrackerBloc, ProgressTrackerState>(
          listener: (context, state) {
            if (state is SuccessfullyCreatedProgressTrackerState) {
              context.read<ProgressTrackerBloc>().add(LoadProgressTrackerList());
            }

            if (state is LoadedProgressTrackersListState) {
              Future.delayed(Duration(seconds: 1));
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            if (state is LoadingProgressTrackerState) {
              return const CircularProgressIndicator();
            }

            return Form(
              key: _formKey,
              child: Column(
                spacing: SizeUtils.size32,
                children: [
                  // type
                  ProjectTypeDropdown(
                    selectedOption: _typeSelected,
                    onChanged: (value) {
                      setState(() {
                        _typeSelected = value;
                      });
                    },
                  ),

                  // name
                  TextFormField(
                    controller: _projectNameController,
                    decoration: InputDecoration(
                      labelText: '${_typeSelected ?? 'Project'} name:',
                      hintText: 'Enter the name of the ${_typeSelected ?? 'project'} you want to track',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please, name what you want to track';
                      }

                      return null;
                    },
                    // onChanged: (value) =>
                    //     setState(() => _projectNameController.text = value),
                  ),

                  //unity
                  ProjectUnityDropdown(selectedOption: _unitySelected, onChanged: (value) => setState(() => _unitySelected = value)),

                  //total positions
                  TextFormField(
                    controller: _totalPositionsController,
                    decoration: InputDecoration(
                      labelText: 'Total of ${_unitySelected ?? 'positions'}',
                      hintText: 'The amount of ${_unitySelected ?? 'positions'} your ${_typeSelected ?? 'project'} has',
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter with a value for total ${_unitySelected ?? 'positions'}';
                      }

                      if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }

                      if (int.tryParse(value)! <= 0) {
                        return 'The total of positions must be greater than zero!';
                      }

                      return null;
                    },
                  ),

                  //current position
                  TextFormField(
                    controller: _currentPositionController,
                    decoration: InputDecoration(
                      labelText: 'Your current ${_unitySelected ?? 'position'}',
                      hintText: 'Where you are in ${_projectNameController.text}',
                      border: const OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.numberWithOptions(),
                    //todo: implement validator
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter with a value for the current ${_unitySelected ?? 'position'}';
                      }

                      if (int.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }

                      int totalPositions = int.parse(_totalPositionsController.text);
                      int currentPosition = int.parse(_currentPositionController.text);

                      if (currentPosition > totalPositions) {
                        return 'The current ${_unitySelected ?? 'position'} can\'t be greater than the total ${_unitySelected ?? 'positions'}';
                      }

                      return null;
                    },
                    // onChanged: (value) =>
                    //     setState(() => _currentPositionController.text = value),
                  ),
                  const SizedBox(height: SizeUtils.size16),
                  FilledButton(
                    onPressed: () => _submit(bloc: context.read<ProgressTrackerBloc>()),
                    child: Text('Create Tracker!'),
                  ),
                  //todo: add action when inserting was successful
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
