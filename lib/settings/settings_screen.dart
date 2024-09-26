import 'package:dsa_tracker/common/themes/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            // Theme Selection Section
            Text('Theme', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            BlocBuilder<ThemeCubit, ThemeData>(
              builder: (context, theme) {
                return Column(
                  children: AppTheme.values.map((appTheme) {
                    return RadioListTile<AppTheme>(
                      title: Text(_getThemeName(appTheme)),
                      value: appTheme,
                      groupValue: _getCurrentTheme(theme),
                      onChanged: (AppTheme? value) {
                        if (value != null) {
                          context
                              .read<ThemeCubit>()
                              .updateTheme(value); // Save theme to prefs
                        }
                      },
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to determine the currently selected theme
  AppTheme _getCurrentTheme(ThemeData theme) {
    return appThemeData.entries.firstWhere((entry) => entry.value == theme).key;
  }

  // Helper function to get readable theme names
  String _getThemeName(AppTheme appTheme) {
    switch (appTheme) {
      case AppTheme.Light:
        return 'Light Theme';
      case AppTheme.Dark:
        return 'Dark Theme';
      case AppTheme.Yellow:
        return 'Yellow Theme';
      case AppTheme.Red:
        return 'Red Theme';
      case AppTheme.Green:
        return 'Green Theme';
      case AppTheme.Purple:
        return 'Purple Theme';
      case AppTheme.Orange:
        return 'Orange Theme';
      case AppTheme.Pink:
        return 'Pink Theme';
      case AppTheme.Cyan:
        return 'Cyan Theme';
      case AppTheme.Indigo:
        return 'Indigo Theme';
      case AppTheme.Brown:
        return 'Brown Theme';
      case AppTheme.Teal:
        return 'Teal Theme';
      default:
        return 'Unknown Theme';
    }
  }
}
