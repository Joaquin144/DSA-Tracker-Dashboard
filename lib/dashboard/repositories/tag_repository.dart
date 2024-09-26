import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsa_tracker/dashboard/models/tag_model.dart';

class TagRepository {
  final CollectionReference tagCollection =
      FirebaseFirestore.instance.collection('tags');

  Future<List<TagModel>> fetchTags() async {
    try {
      final snapshot = await tagCollection.get();
      return snapshot.docs.map((doc) {
        return TagModel.fromFirestore(
            doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    } catch (e) {
      throw Exception('Failed to load tags');
    }
  }
}
