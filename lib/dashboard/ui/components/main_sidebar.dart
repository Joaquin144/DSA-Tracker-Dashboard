// Sidebar widget for tag filtering
import 'package:dsa_tracker/dashboard/blocs/task_bloc.dart';
import 'package:dsa_tracker/dashboard/blocs/task_event.dart';
import 'package:dsa_tracker/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainSidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskBloc = BlocProvider.of<TaskBloc>(context);

    return Container(
      width: 200,
      color: Colors.blueGrey[50],
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Joaquin',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      _openSettings(context);
                    },
                    child: Text('View profile'))
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.task),
            title: Text('All Tasks'),
            onTap: () {
              taskBloc.add(FilterTasksByTag('All Tasks'));
            },
          ),
          ListTile(
            leading: Icon(Icons.web),
            title: Text('UI/UX Design'),
            onTap: () {
              taskBloc.add(FilterTasksByTag('UI/UX Design'));
            },
          ),
          ListTile(
            leading: Icon(Icons.code),
            title: Text('Backend'),
            onTap: () {
              taskBloc.add(FilterTasksByTag('Backend'));
            },
          ),
        ],
      ),
    );
  }

  void _openSettings(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SettingsScreen()),
    );
  }
}
