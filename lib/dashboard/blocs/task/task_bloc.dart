import 'package:dsa_tracker/dashboard/models/task_model.dart';
import 'package:dsa_tracker/dashboard/repositories/task_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository _taskRepository;

  List<TaskModel> _allTasks = []; // This will hold all tasks for filtering

  TaskBloc(this._taskRepository) : super(TaskLoading()) {
    // Event handler for FetchTasks
    on<FetchTasks>((event, emit) async {
      try {
        emit(TaskLoading());
        final tasks = await _taskRepository.fetchTasks();
        _allTasks = tasks; // Cache tasks for filtering
        emit(TaskLoaded(tasks));
      } catch (e) {
        emit(TaskError('Failed to fetch tasks: $e'));
      }
    });

    // Event handler for AddTask
    on<AddTask>((event, emit) async {
      try {
        await _taskRepository.addTask(event.task);
        _allTasks.add(event.task); // Update local cache
        emit(TaskLoaded(_allTasks)); // Refresh UI
      } catch (e) {
        emit(TaskError('Failed to add task'));
      }
    });

    // Event handler for FilterTasksByTag
    on<FilterTasksByTag>((event, emit) {
      if (event.tag == 'All Tasks') {
        emit(TaskLoaded(_allTasks));
      } else {
        final filteredTasks = _allTasks
            .where((task) => task.tags?.contains(event.tag) ?? false)
            .toList();
        emit(TaskFiltered(filteredTasks));
      }
    });
  }
}
