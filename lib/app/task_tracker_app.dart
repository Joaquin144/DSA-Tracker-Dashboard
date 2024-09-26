import 'package:dsa_tracker/common/themes/theme_cubit.dart';
import 'package:dsa_tracker/dashboard/blocs/task_bloc.dart';
import 'package:dsa_tracker/dashboard/blocs/task_event.dart';
import 'package:dsa_tracker/dashboard/repositories/task_repository.dart';
import 'package:dsa_tracker/dashboard/services/actual/task_service_impl.dart';
import 'package:dsa_tracker/dashboard/ui/task_tracker_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskTrackerApp extends StatelessWidget {
  final ThemeCubit themeCubit;

  TaskTrackerApp({required this.themeCubit});

  @override
  Widget build(BuildContext context) {
    final TaskRepository taskRepository = TaskRepository(TaskServiceImpl());

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => themeCubit,
        ),
        BlocProvider(
          create: (context) => TaskBloc(taskRepository)..add(FetchTasks()),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            title: 'Task Tracker',
            theme: theme, // Apply the selected theme
            home: TaskDashboard(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
