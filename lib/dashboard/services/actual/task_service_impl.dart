import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsa_tracker/dashboard/models/task_model.dart';
import 'package:dsa_tracker/dashboard/services/task_service.dart';

class TaskServiceImpl extends TaskService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<TaskModel>> getTasks() async {
    final snapshot = await _firestore.collection('tasks').get();
    return snapshot.docs.map((doc) {
      final data = doc.data();
      return TaskModel(
        id: data['id'],
        name: data['name'],
        tags: List<String>.from(data['tags']),
        approach: data['approach'],
        rating: data['rating'].toDouble(),
      );
    }).toList();
  }

  Future<void> addTask(TaskModel task) async {
    await _firestore.collection('tasks').add({
      'id': task.id,
      'name': task.name,
      'tags': task.tags,
      'approach': task.approach,
      'rating': task.rating,
    });
  }
}
