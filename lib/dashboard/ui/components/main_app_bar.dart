import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  MainAppBar({super.key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super();

  @override
  final Size preferredSize; // default is 56.0

  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('DSA Tracker'),
      actions: [
        IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatar.png'),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
