import 'package:flutter/material.dart';

import '../../widgets/app_screen.dart';

class CreateTrackerScreen extends StatelessWidget {
  const CreateTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Center(
        child: Text(
          'WELCOME TO THE SCREEN WHERE YOU WILL CREATE YOUR TRACKER!',
        ),
      ),
    );
  }
}
