// Sidebar widget for tag filtering
import 'package:dsa_tracker/dashboard/blocs/tag/tag_bloc.dart';
import 'package:dsa_tracker/dashboard/blocs/task/task_bloc.dart';
import 'package:dsa_tracker/dashboard/blocs/task/task_event.dart';
import 'package:dsa_tracker/dashboard/models/tag_model.dart';
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
          BlocBuilder<TagBloc, TagState>(
            builder: (context, state) {
              if (state is TagLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is TagLoaded) {
                return Column(
                  children: state.tags.map((TagModel tag) {
                    return ListTile(
                      leading: Icon(Icons.label),
                      title: Text(tag.name),
                      onTap: () {
                        // Filter tasks based on selected tag
                        //Navigator.pop(context);--> Once make this drawer then do pop()
                        // Trigger the event to filter tasks
                        context
                            .read<TaskBloc>()
                            .add(FilterTasksByTag(tag.name));
                      },
                    );
                  }).toList(),
                );
              } else if (state is TagError) {
                return ListTile(
                  title: Text('Failed to load tags'),
                );
              }
              return Container();
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
