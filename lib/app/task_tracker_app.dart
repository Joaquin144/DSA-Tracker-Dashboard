import 'package:dsa_tracker/dashboard/task_tracker_dashboard.dart';
import 'package:flutter/material.dart';

class TaskTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskTrackerDashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
