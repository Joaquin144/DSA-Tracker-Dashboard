import 'package:dsa_tracker/dashboard/ui/components/add_task_form.dart';
import 'package:flutter/material.dart';

class AddTaskFloatingActionButton extends FloatingActionButton {
  const AddTaskFloatingActionButton({super.key, super.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showAddTaskModal(context),
      tooltip: 'Add Task',
      child: const Icon(Icons.add),
    );
  }

  void _showAddTaskModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: AddTaskForm(),
        );
      },
    );
  }
}
