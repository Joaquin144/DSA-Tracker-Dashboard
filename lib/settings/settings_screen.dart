import 'package:dsa_tracker/common/themes/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String selectedColor = 'Blue';
  AppThemeMode selectedMode = AppThemeMode.Light;

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Profile', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            // Placeholder for user details
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            Text('Theme', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            // Dropdown for selecting Color
            BlocBuilder<ThemeCubit, ThemeData>(
              builder: (context, theme) {
                return DropdownButton<String>(
                  value: selectedColor,
                  items: themeCubit.appColors.keys.map((String colorName) {
                    return DropdownMenuItem<String>(
                      value: colorName,
                      child: Text(colorName),
                    );
                  }).toList(),
                  onChanged: (String? newColor) {
                    if (newColor != null) {
                      setState(() {
                        selectedColor = newColor;
                      });
                    }
                  },
                );
              },
            ),
            SizedBox(height: 20),
            // Toggle Button for Light/Dark Mode with Sun/Moon icon
            Row(
              children: [
                Text('Mode: '),
                IconButton(
                  icon: selectedMode == AppThemeMode.Light
                      ? Icon(Icons.wb_sunny, color: Colors.yellow)
                      : Icon(Icons.nights_stay, color: Colors.blueGrey),
                  onPressed: () {
                    setState(() {
                      // Toggle the theme mode
                      selectedMode = selectedMode == AppThemeMode.Light
                          ? AppThemeMode.Dark
                          : AppThemeMode.Light;
                    });
                  },
                ),
                Text(
                  selectedMode == AppThemeMode.Light
                      ? 'Light Mode'
                      : 'Dark Mode',
                ),
              ],
            ),
            SizedBox(height: 20),
            // Save Button to Apply Selected Theme and Mode
            ElevatedButton(
              onPressed: () {
                themeCubit.updateTheme(selectedColor, selectedMode);
              },
              child: Text('Save Theme'),
            ),
          ],
        ),
      ),
    );
  }
}
