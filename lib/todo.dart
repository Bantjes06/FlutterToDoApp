import 'package:flutter/material.dart';
import 'package:todoapp/tasks_list.dart';
import 'tasks.dart';
import 'new_task.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  var adjustedIcon = Icons.cancel_presentation_sharp;

  final List<Task> _registeredTask = [];

// Method to show the modal bottom sheet for adding a new task.
  void _openAddTaskOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewTask(
        onAddTask: _addTask,
      ),
    );
  }

// Method to remove a task from the list.
  void _addTask(Task task) {
    setState(() {
      _registeredTask.add(task);
    });
  }

// Method to remove a task from the list.
  void _removeTask(Task task) {
    final taskIndex = _registeredTask.indexOf(task);
    setState(() {
      _registeredTask.remove(task);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Task removed'),
        action: SnackBarAction(label: 'Undo', onPressed: () {
          setState(() {
            _registeredTask.insert(taskIndex, task);
          });
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
  // Logic to conditionally display content based on whether tasks are present.
    Widget mainContent = const Center(
      child: Text('No tasks found. Add some tasks!'),
    );

    if (_registeredTask.isNotEmpty) {
      mainContent = TasksList(
        tasks: _registeredTask,
        onRemoveTask: _removeTask,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do App'),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25))),
        backgroundColor: Colors.greenAccent[400],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.greenAccent[400],
          onPressed: _openAddTaskOverlay,
          child: const Text(
            'Add',
          )),
      body: mainContent,
    );
  }
}
