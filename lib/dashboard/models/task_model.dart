class TaskModel {
  final int id;
  final String name;
  final List<String> tags;
  final String approach;
  final double rating;

  TaskModel({
    required this.id,
    required this.name,
    required this.tags,
    required this.approach,
    required this.rating,
  });
}
