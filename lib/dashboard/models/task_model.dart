class TaskModel {
  final int id;
  final String name;
  final List<String>? tags;
  final String? approach;
  final double? rating;
  final String url;

  TaskModel({
    required this.id,
    required this.name,
    this.tags,
    this.approach,
    this.rating,
    required this.url,
  });
}
