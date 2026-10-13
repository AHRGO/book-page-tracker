import 'package:flutter/material.dart';

import '../app/app_screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScreen(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
