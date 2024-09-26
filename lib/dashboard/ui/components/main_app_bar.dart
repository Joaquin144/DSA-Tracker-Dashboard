import 'package:flutter/material.dart';

class MainAppBar extends AppBar {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('DSA Tracker'),
      actions: [
        IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatar.png'),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
