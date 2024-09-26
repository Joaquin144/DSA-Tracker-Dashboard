import 'package:dsa_tracker/dashboard/components/task_row.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TaskTrackerDashboard extends StatefulWidget {
  @override
  _TaskTrackerDashboardState createState() => _TaskTrackerDashboardState();
}

class _TaskTrackerDashboardState extends State<TaskTrackerDashboard> {
  String selectedTag = 'All Tasks';

  // Task data with multiple tags
  List<Map<String, dynamic>> tasks = [
    {
      'id': 1,
      'name': 'Design Homepage',
      'tags': ['UI/UX Design'],
      'approach': 'Wireframe',
      'rating': 5.0
    },
    {
      'id': 2,
      'name': 'Develop API',
      'tags': ['Backend', 'Development'],
      'approach': 'RESTful',
      'rating': 4.0
    },
    {
      'id': 3,
      'name': 'Write Documentation',
      'tags': ['Documentation', 'Writing'],
      'approach': 'Markdown',
      'rating': 4.5
    },
    {
      'id': 4,
      'name': 'Set Up Database',
      'tags': ['Database', 'Setup'],
      'approach': 'SQL',
      'rating': 4.0
    },
    {
      'id': 5,
      'name': 'Koko eating bananas',
      'tags': ['Binary Search'],
      'approach': 'Algorithm',
      'rating': 5.0
    },
    {
      'id': 6,
      'name': 'Max islands',
      'tags': ['Arrays', 'DFS', 'BFS', 'Graphs'],
      'approach': 'Algorithm',
      'rating': 4.0
    },
  ];

  // Filters tasks based on the selected tag
  List<Map<String, dynamic>> get filteredTasks {
    if (selectedTag == 'All Tasks') return tasks;
    return tasks.where((task) => task['tags'].contains(selectedTag)).toList();
  }

  // Handles sidebar filter selection
  void filterTasksByTag(String tag) {
    setState(() {
      selectedTag = tag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TaskFlow'),
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 200,
            color: Colors.blueGrey[50],
            child: ListView(
              children: [
                DrawerHeader(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amanda',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('View profile'),
                      )
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.task),
                  title: Text('All Tasks'),
                  onTap: () => filterTasksByTag('All Tasks'),
                ),
                ListTile(
                  leading: Icon(Icons.web),
                  title: Text('UI/UX Design'),
                  onTap: () => filterTasksByTag('UI/UX Design'),
                ),
                ListTile(
                  leading: Icon(Icons.app_registration),
                  title: Text('Backend'),
                  onTap: () => filterTasksByTag('Backend'),
                ),
                ListTile(
                  leading: Icon(Icons.developer_board),
                  title: Text('Development'),
                  onTap: () => filterTasksByTag('Development'),
                ),
                ListTile(
                  leading: Icon(Icons.code),
                  title: Text('Algorithms'),
                  onTap: () => filterTasksByTag('Binary Search'),
                ),
              ],
            ),
          ),
          // Main Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'All Tasks',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  // Header row
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text('S.No.',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                            flex: 3,
                            child: Text('Task Name',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                            flex: 3,
                            child: Text('Tags',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                            flex: 2,
                            child: Text('Approach',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        Expanded(
                            flex: 1,
                            child: Text('Rating',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredTasks.length,
                      itemBuilder: (context, index) {
                        final task = filteredTasks[index];
                        return TaskRow(
                          serialNo: task['id'],
                          taskName: task['name'],
                          tags: task['tags'],
                          approach: task['approach'],
                          rating: task['rating'],
                          onTaskClick: () => _openTaskUrl(task['id']),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle task addition logic here
        },
        child: Icon(Icons.add),
        tooltip: 'Add Task',
      ),
    );
  }

  // Open task URL in a new browser tab
  void _openTaskUrl(String taskId) async {
    final url = Uri(path: 'http://localhost:8080/tasks/$taskId');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
