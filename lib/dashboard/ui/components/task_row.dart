import 'package:flutter/material.dart';

class TaskRow extends StatelessWidget {
  final int serialNo;
  final String taskName;
  final List<String> tags;
  final String approach;
  final double rating;
  final VoidCallback onTaskClick;

  TaskRow({
    required this.serialNo,
    required this.taskName,
    required this.tags,
    required this.approach,
    required this.rating,
    required this.onTaskClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(flex: 1, child: Text('$serialNo')),
          Expanded(
            flex: 3,
            child: InkWell(
              onTap: onTaskClick,
              child: Text(
                taskName,
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(tags.join(', ')),
          ),
          Expanded(
            flex: 2,
            child: Text(approach),
          ),
          Expanded(
            flex: 1,
            child: Text(rating.toString()),
          ),
        ],
      ),
    );
  }
}
