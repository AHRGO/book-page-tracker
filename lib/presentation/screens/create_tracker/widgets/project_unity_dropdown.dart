import 'package:flutter/material.dart';

import '../../../../utils/app_sizes.dart';

class ProjectUnityDropdown extends StatelessWidget {
  final Function(String?) onChanged;
  final String? selectedOption;

  const ProjectUnityDropdown({
    super.key,
    required this.onChanged,
    this.selectedOption,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('What you will be tracking?'),
        const SizedBox(height: AppSizes.size4),
        DropdownButtonFormField(
          items: _projectUnities
              .map(
                (unity) => DropdownMenuItem(
                  value: unity,
                  child: Text(unity),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}

const List<String> _projectUnities = [
  'Pages',
  'Chapters',
  'Episodes',
  'Seasons',
  'Levels',
];
