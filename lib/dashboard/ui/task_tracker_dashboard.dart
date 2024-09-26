import 'package:dsa_tracker/dashboard/blocs/task/task_bloc.dart';
import 'package:dsa_tracker/dashboard/blocs/task/task_state.dart';
import 'package:dsa_tracker/dashboard/models/task_model.dart';
import 'package:dsa_tracker/dashboard/ui/components/add_task_fab.dart';
import 'package:dsa_tracker/dashboard/ui/components/main_sidebar.dart';
import 'package:dsa_tracker/dashboard/ui/components/task_row.dart';
import 'package:dsa_tracker/dashboard/ui/components/tasks_header_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/main_app_bar.dart';

class TaskDashboard extends StatelessWidget {
  const TaskDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Row(
        children: [
          // Sidebar
          MainSidebar(),
          // Main Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TasksHeaderRow(),
                  const Divider(),
                  // Task List
                  BlocBuilder<TaskBloc, TaskState>(
                    builder: (context, state) {
                      if (state is TaskLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is TaskLoaded || state is TaskFiltered) {
                        List<TaskModel> tasks = (state is TaskLoaded)
                            ? state.tasks
                            : (state as TaskFiltered).filteredTasks;
                        return Expanded(
                          child: ListView.builder(
                            itemCount: tasks.length,
                            itemBuilder: (context, index) {
                              final task = tasks[index];
                              return TaskRow(
                                serialNo: index + 1,
                                taskName: task.name,
                                tags: task.tags ?? [],
                                approach: task.approach,
                                rating: task.rating,
                                onTaskClick: () => _openTaskUrl(task.url),
                              );
                            },
                          ),
                        );
                      } else if (state is TaskError) {
                        return Center(child: Text(state.message));
                      } else {
                        return const Center(child: Text('No tasks available'));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: const AddTaskFloatingActionButton(),
    );
  }

  void _openTaskUrl(String urlString) async {
    // Open task URL in a new browser tab
    //final url = Uri(path: urlString);
    if (await canLaunch(urlString)) {
      await launch(urlString);
    } else {
      throw 'Could not launch $urlString';
    }
  }
}
