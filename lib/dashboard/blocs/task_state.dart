import '../models/task_model.dart';

abstract class TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<TaskModel> tasks;

  TaskLoaded(this.tasks);
}

class TaskError extends TaskState {
  final String message;

  TaskError(this.message);
}

class TaskFiltered extends TaskState {
  final List<TaskModel> filteredTasks;

  TaskFiltered(this.filteredTasks);
}
