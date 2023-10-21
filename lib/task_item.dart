import 'package:flutter/material.dart';
import 'package:todoapp/tasks.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({required this.tasks, super.key});

  final Task tasks;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.tasks.title, style: const TextStyle(
                  fontWeight: FontWeight.bold
                )),
                const SizedBox(
                  height: 5,
                ),
                Text(widget.tasks.task),
              ],
            ),
            Checkbox(value: value, activeColor: Colors.white, checkColor: Colors.greenAccent[400], onChanged: (value) {
              setState(() {
                this.value = true;
              });
            })
          ],
        ),
      ),
    );
  }
}
