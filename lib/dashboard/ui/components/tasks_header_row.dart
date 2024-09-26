import 'package:flutter/material.dart';

class TasksHeaderRow extends StatelessWidget {
  const TasksHeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('S.No.', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Tags', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Approach', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Rating', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
