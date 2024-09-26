import 'package:dsa_tracker/dashboard/models/task_model.dart';

abstract class TaskService {
  Future<List<TaskModel>> getTasks();

  Future<void> addTask(TaskModel task);
}
