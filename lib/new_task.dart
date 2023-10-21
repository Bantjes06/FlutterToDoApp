import 'package:flutter/material.dart';
import 'tasks.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key, required this.onAddTask});
  final void Function(Task task) onAddTask;
  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {

// Controllers for text fields to hold the task title and description.
  final _titleController = TextEditingController();
  final _descriptController = TextEditingController();

// Dispose of controllers to free up resources.
  @override
  void dispose() {
    _titleController.dispose();
    _descriptController.dispose();
    super.dispose();
  }

// Function to handle the form submission.
  void _submitTaskData() {
    if (_titleController.text.trim().isEmpty ||
        _descriptController.text.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (ctx) =>
            AlertDialog(
              title: const Text('Invalid Input'),
              content: const Text('Please fill in title and description'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const Text('Okay'),
                ),
              ],
            ),
          );
          return;
        }
        widget.onAddTask(
        Task(title: _titleController.text, task: _descriptController.text),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 20,
            decoration: const InputDecoration(label: Text('Title:')),
          ),
          TextField(
            controller: _descriptController,
            maxLength: 40,
            decoration: const InputDecoration(label: Text('Description:')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent[400]),
                onPressed: _submitTaskData,
                child: const Text('Save'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'))
            ],
          )
        ],
      ),
    );
  }
}
