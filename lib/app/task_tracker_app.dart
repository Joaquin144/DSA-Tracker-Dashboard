import 'package:dsa_tracker/dashboard/blocs/task_bloc.dart';
import 'package:dsa_tracker/dashboard/blocs/task_event.dart';
import 'package:dsa_tracker/dashboard/repositories/task_repository.dart';
import 'package:dsa_tracker/dashboard/services/task_service.dart';
import 'package:dsa_tracker/dashboard/ui/task_tracker_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TaskRepository taskRepository = TaskRepository(TaskService());

    return MaterialApp(
      title: 'Task Tracker',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: BlocProvider(
        create: (context) => TaskBloc(taskRepository)..add(FetchTasks()),
        child: TaskDashboard(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
