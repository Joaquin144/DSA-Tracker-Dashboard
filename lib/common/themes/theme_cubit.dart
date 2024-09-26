import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Define available themes with additional color themes
enum AppTheme {
  Light,
  Dark,
  Yellow,
  Red,
  Green,
  Purple,
  Orange,
  Pink,
  Cyan,
  Indigo,
  Brown,
  Teal,
}

// Mapping AppTheme to actual ThemeData
final appThemeData = {
  AppTheme.Light: ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
  ),
  AppTheme.Dark: ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
  ),
  AppTheme.Yellow: ThemeData(
    primarySwatch: Colors.yellow,
  ),
  AppTheme.Red: ThemeData(
    primarySwatch: Colors.red,
  ),
  AppTheme.Green: ThemeData(
    primarySwatch: Colors.green,
  ),
  AppTheme.Purple: ThemeData(
    primarySwatch: Colors.purple,
  ),
  AppTheme.Orange: ThemeData(
    primarySwatch: Colors.orange,
  ),
  AppTheme.Pink: ThemeData(
    primarySwatch: Colors.pink,
  ),
  AppTheme.Cyan: ThemeData(
    primarySwatch: Colors.cyan,
  ),
  AppTheme.Indigo: ThemeData(
    primarySwatch: Colors.indigo,
  ),
  AppTheme.Brown: ThemeData(
    primarySwatch: Colors.brown,
  ),
  AppTheme.Teal: ThemeData(
    primarySwatch: Colors.teal,
  ),
};

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(appThemeData[AppTheme.Light]!);

  // Load theme from SharedPreferences at startup
  Future<void> loadThemeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt('theme') ?? 0; // Default to Light theme
    updateTheme(AppTheme.values[themeIndex]);
  }

  // Update theme and save to SharedPreferences
  void updateTheme(AppTheme theme) async {
    emit(appThemeData[theme]!);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme', theme.index); // Save theme index
  }
}
