class TagModel {
  final String id;
  final String name;

  TagModel({required this.id, required this.name});

  factory TagModel.fromFirestore(Map<String, dynamic> data, String id) {
    return TagModel(
      id: id,
      name: data['name'] as String,
    );
  }
}
