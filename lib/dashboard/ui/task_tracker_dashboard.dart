import 'package:dsa_tracker/dashboard/blocs/task_bloc.dart';
import 'package:dsa_tracker/dashboard/blocs/task_event.dart';
import 'package:dsa_tracker/dashboard/blocs/task_state.dart';
import 'package:dsa_tracker/dashboard/models/task_model.dart';
import 'package:dsa_tracker/dashboard/ui/components/main_sidebar.dart';
import 'package:dsa_tracker/dashboard/ui/components/task_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class TaskDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TaskFlow'),
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
          SizedBox(width: 10),
        ],
      ),
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
                  Text(
                    'All Tasks',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  // Task List
                  BlocBuilder<TaskBloc, TaskState>(
                    builder: (context, state) {
                      if (state is TaskLoading) {
                        return Center(child: CircularProgressIndicator());
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
                                serialNo: task.id,
                                taskName: task.name,
                                tags: task.tags,
                                approach: task.approach,
                                rating: task.rating,
                                onTaskClick: () => _openTaskUrl(task.id),
                              );
                            },
                          ),
                        );
                      } else if (state is TaskError) {
                        return Center(child: Text(state.message));
                      } else {
                        return Center(child: Text('No tasks available'));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Trigger the add task event in Bloc
          final taskBloc = BlocProvider.of<TaskBloc>(context);
          taskBloc.add(AddTask(TaskModel(
              id: 7,
              name: 'New Task',
              tags: ['New Tag'],
              approach: 'New Approach',
              rating: 4)));
        },
        child: Icon(Icons.add),
        tooltip: 'Add Task',
      ),
    );
  }

  void _openTaskUrl(int taskId) async {
    // Open task URL in a new browser tab
    final url = 'http://localhost:8080/tasks/$taskId';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
