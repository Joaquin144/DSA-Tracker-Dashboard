import 'package:dsa_tracker/app/task_tracker_app.dart';
import 'package:dsa_tracker/common/themes/theme_cubit.dart';
import 'package:dsa_tracker/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final ThemeCubit themeCubit = ThemeCubit();
  await themeCubit.loadThemeFromPreferences();

  runApp(TaskTrackerApp(themeCubit: themeCubit));
}
