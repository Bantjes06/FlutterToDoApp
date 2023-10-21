import 'package:flutter/material.dart';
import 'package:todoapp/task_item.dart';
import 'new_task.dart';
import 'tasks.dart';

class TasksList extends StatelessWidget {
  TasksList({super.key, required this.tasks, required this.onRemoveTask});

  void Function(Task task) onRemoveTask; 

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (ctx, index) => Dismissible(
        onDismissed: (direction) {
          onRemoveTask(tasks[index]);
        },
        key: ValueKey(
          tasks[index],
        ),
        child: TaskItem(
          tasks: tasks[index],
        ),
      ),
    );
  }
}
