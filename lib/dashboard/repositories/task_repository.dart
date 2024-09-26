import 'package:dsa_tracker/dashboard/models/task_model.dart';
import 'package:dsa_tracker/dashboard/services/task_service.dart';

class TaskRepository {
  final TaskService _taskService;

  TaskRepository(this._taskService);

  Future<List<TaskModel>> fetchTasks() {
    return _taskService.getTasks();
  }

  Future<void> addTask(TaskModel task) {
    return _taskService.addTask(task);
  }
}
