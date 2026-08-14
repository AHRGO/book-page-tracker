import 'package:flutter/material.dart';

import '../../../../utils/size_utils.dart';

class ProjectTypeDropdown extends StatelessWidget {
  final Function(String?) onChanged;
  final String? selectedOption;

  const ProjectTypeDropdown({
    super.key,
    required this.onChanged,
    this.selectedOption,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('What are you tracking your progress on?'),
        const SizedBox(height: SizeUtils.size4),
        DropdownButtonFormField(
          items: _projectTypes
              .map(
                (type) => DropdownMenuItem(
                  value: type,
                  child: Text(type),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}

const List<String> _projectTypes = [
  'Book',
  'Series',
  'Videogame',
];
