import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import 'datasources/hive_datasource.dart';
import 'datasources/hive_registrar.g.dart';
import 'presentation/bloc/progress_tracker_bloc.dart';
import 'presentation/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapters();
  HiveDatasource().initHive();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progress Tracker',
      home: BlocProvider(create: (context) => ProgressTrackerBloc()..add(LoadProgressTrackerList()), child: HomeScreen()),
    );
  }
}
