import '../models/task_model.dart';

class TaskService {
  Future<List<TaskModel>> getTasks() async {
    // Simulating network call or database call
    return [
      TaskModel(
          id: 1,
          name: 'Design Homepage',
          tags: ['UI/UX Design'],
          approach: 'Wireframe',
          rating: 5.0),
      TaskModel(
          id: 2,
          name: 'Develop API',
          tags: ['Backend', 'Development'],
          approach: 'RESTful',
          rating: 4.0),
      // Add more tasks
    ];
  }

  Future<void> addTask(TaskModel task) async {
    // Logic for adding a task (can be connected to Firebase)
    // For now, we're just simulating a network/database call
  }
}
