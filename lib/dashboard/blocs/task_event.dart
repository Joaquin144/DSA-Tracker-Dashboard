import '../models/task_model.dart';

abstract class TaskEvent {}

class FetchTasks extends TaskEvent {}

class AddTask extends TaskEvent {
  final TaskModel task;

  AddTask(this.task);
}

class FilterTasksByTag extends TaskEvent {
  final String tag;

  FilterTasksByTag(this.tag);
}
