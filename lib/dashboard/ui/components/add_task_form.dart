import 'package:dsa_tracker/dashboard/blocs/task_bloc.dart';
import 'package:dsa_tracker/dashboard/blocs/task_event.dart';
import 'package:dsa_tracker/dashboard/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskForm extends StatefulWidget {
  @override
  _AddTaskFormState createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _tagsController = TextEditingController();
  final TextEditingController _approachController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Add New Task', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            // ID Field (Required)
            TextFormField(
              controller: _idController,
              decoration: InputDecoration(labelText: 'Task ID'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the Task ID';
                }
                return null;
              },
            ),
            // Name Field (Required)
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Task Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the Task Name';
                }
                return null;
              },
            ),
            // URL Field (Required)
            TextFormField(
              controller: _urlController,
              decoration: InputDecoration(labelText: 'Task URL'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the Task URL';
                }
                return null;
              },
            ),
            // Tags Field (Optional)
            TextFormField(
              controller: _tagsController,
              decoration: InputDecoration(labelText: 'Tags (comma-separated)'),
            ),
            // Approach Field (Optional)
            TextFormField(
              controller: _approachController,
              decoration: InputDecoration(labelText: 'Approach'),
            ),
            // Rating Field (Optional)
            TextFormField(
              controller: _ratingController,
              decoration: InputDecoration(labelText: 'Rating (0 to 5)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Add the new task
                  final taskBloc = BlocProvider.of<TaskBloc>(context);
                  final newTask = TaskModel(
                    id: int.parse(_idController.text),
                    name: _nameController.text,
                    url: _urlController.text,
                    tags: _tagsController.text.isNotEmpty
                        ? _tagsController.text
                            .split(',')
                            .map((e) => e.trim())
                            .toList()
                        : null,
                    approach: _approachController.text.isNotEmpty
                        ? _approachController.text
                        : null,
                    rating: _ratingController.text.isNotEmpty
                        ? double.tryParse(_ratingController.text)
                        : null,
                  );
                  taskBloc.add(AddTask(newTask));
                  Navigator.pop(context); // Close the modal
                }
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _urlController.dispose();
    _tagsController.dispose();
    _approachController.dispose();
    _ratingController.dispose();
    super.dispose();
  }
}
