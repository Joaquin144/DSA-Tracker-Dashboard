import 'package:dsa_tracker/dashboard/models/task_model.dart';
import 'package:dsa_tracker/dashboard/services/task_service.dart';

class TaskServiceMock extends TaskService {
  Future<List<TaskModel>> getTasks() async {
    // Simulating network call or database call
    return [
      TaskModel(
        id: 1,
        name: 'Koko Eating Bananas',
        tags: ['Binary Search'],
        approach: 'Try Binary Search on Answer',
        rating: 5.0,
        url: 'https://leetcode.com/problems/koko-eating-bananas/',
      ),
      TaskModel(
        id: 2,
        name: 'Number of Islands',
        tags: ['BFS', 'DFS', 'Graphs'],
        approach: 'Start from all nodes and maintain islands count',
        rating: 4.0,
        url: 'https://leetcode.com/problems/number-of-islands/description/',
      ),
      // Add more tasks
    ];
  }

  Future<void> addTask(TaskModel task) async {
    // Logic for adding a task (can be connected to Firebase)
    // For now, we're just simulating a network/database call
  }
}
