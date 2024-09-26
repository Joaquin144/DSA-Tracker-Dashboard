import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppThemeMode { Light, Dark }

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_defaultTheme);

  static const String _themeColorKey = 'theme_color';
  static const String _themeModeKey = 'theme_mode';

  // Default Theme (can set to Light and Blue)
  static final ThemeData _defaultTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
  );

  // Map of available colors
  final Map<String, MaterialColor> appColors = {
    'Blue': Colors.blue,
    'Yellow': Colors.yellow,
    'Red': Colors.red,
    'Green': Colors.green,
    'Purple': Colors.purple,
    'Orange': Colors.orange,
    'Pink': Colors.pink,
    'Cyan': Colors.cyan,
    'Indigo': Colors.indigo,
    'Brown': Colors.brown,
    'Teal': Colors.teal,
  };

  // Update theme based on selected color and brightness mode
  void updateTheme(String colorName, AppThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();

    // Save selected color and mode in SharedPreferences
    await prefs.setString(_themeColorKey, colorName);
    await prefs.setString(_themeModeKey, mode.toString());

    // Get the selected color and mode
    final MaterialColor selectedColor = appColors[colorName] ?? Colors.blue;
    final Brightness selectedBrightness =
        mode == AppThemeMode.Dark ? Brightness.dark : Brightness.light;

    // Emit the new theme with the selected color and brightness
    emit(ThemeData(
      primarySwatch: selectedColor,
      brightness: selectedBrightness,
    ));
  }

  // Load theme from SharedPreferences on startup
  Future<void> loadThemeFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final colorName = prefs.getString(_themeColorKey) ?? 'Blue';
    final modeString =
        prefs.getString(_themeModeKey) ?? AppThemeMode.Light.toString();

    final AppThemeMode mode = modeString == AppThemeMode.Dark.toString()
        ? AppThemeMode.Dark
        : AppThemeMode.Light;

    updateTheme(colorName, mode);
  }
}
