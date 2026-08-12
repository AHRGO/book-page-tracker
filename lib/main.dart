import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import 'presentation/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await Hive.openBox('trackers'); //? actual 'table' name?

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progress Tracker',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(
      //     seedColor: Colors.deepPurple,
      //   ),
      // ),
      home: HomeScreen(),
    );
  }
}

///
/// todo: play with hive a little to see how it behaves
///   final box = Hive.box('users');
///   
///   await box.put('name', 'Victor');
///   await box.put('age', 28);
///   
///   print(box.get('name'));
///   print(box.get('age'));
///
///   await box.delete('age');
///
