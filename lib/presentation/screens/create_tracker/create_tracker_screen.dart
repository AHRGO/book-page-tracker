import 'package:flutter/material.dart';
import 'package:progress_tracker/utils/logger.dart';
import 'package:progress_tracker/utils/app_sizes.dart';

import '../../../widgets/app_screen.dart';
import 'widgets/project_type_dropdown.dart';
import 'widgets/project_unity_dropdown.dart';

class CreateTrackerScreen extends StatefulWidget {
  const CreateTrackerScreen({super.key});

  @override
  State<CreateTrackerScreen> createState() =>
      _CreateTrackerScreenState();
}

class _CreateTrackerScreenState
    extends State<CreateTrackerScreen> {
  final _formKey = GlobalKey<FormState>();

  final _projectNameController = TextEditingController();
  final _totalPositionsController = TextEditingController();
  final _currentPositionController = TextEditingController();

  String? _typeSelected;
  String? _unitySelected;

  @override
  void dispose() {
    _projectNameController.dispose();
    _totalPositionsController.dispose();
    _currentPositionController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final name = _projectNameController.text;
    final totalPositions = int.parse(
      _totalPositionsController.text,
    );
    final currentPosition = int.parse(
      _currentPositionController.text,
    );

    Logger.logInfo(
      'The user is at $currentPosition of $totalPositions in $name',
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Form(
        key: _formKey,
        child: Column(
          spacing: AppSizes.size32,
          children: [
            // type
            ProjectTypeDropdown(
              selectedOption: _typeSelected,
              onChanged: (value) {
                Logger.logInfo(':: TYPE SELECTED => $value');
                setState(() {
                  _typeSelected = value;
                });
              },
            ),
            // name
            TextFormField(
              controller: _projectNameController,
              decoration: InputDecoration(
                labelText:
                    '${_typeSelected ?? 'Project'} name:',
                hintText:
                    'Enter the name of the ${_typeSelected ?? 'project'} you want to track',
                border: OutlineInputBorder(),
              ),
              //todo: implement validator
              // validator: (value) {
              //   if (value == null || value.trim().isEmpty) {
              //     return 'Please, name what you want to track';
              //   }

              //   return null;
              // },
            ),
            ProjectUnityDropdown(
              selectedOption: _unitySelected,
              onChanged: (value) {
                Logger.logInfo(':: UNITY SELECTED => $value');
                setState(() {
                  _unitySelected = value;
                });
              },
            ),
            TextFormField(
              controller: _totalPositionsController,
              decoration: InputDecoration(
                labelText:
                    'Total of ${_unitySelected ?? 'positions'}',
                hintText:
                    'The amount of ${_unitySelected ?? 'positions'} your ${_typeSelected ?? 'project'} has',
                border: const OutlineInputBorder(),
              ),
              //todo: implement validator
              // validator: ,
            ),
            TextFormField(
              controller: _currentPositionController,
              decoration: InputDecoration(
                labelText:
                    'Your current ${_unitySelected ?? 'position'}',
                hintText:
                    'Where you are in ${_projectNameController.text}',
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(),
              //todo: implement validator
              // validator: ,
            ),
            const SizedBox(height: AppSizes.size16),
            FilledButton(
              onPressed: _submit,
              child: Text('Create Tracker!'),
            ),
          ],
        ),
      ),
    );
  }
}
