import 'package:flutter/material.dart';
import 'package:todoapp/todo.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(scaffoldBackgroundColor: Colors.grey[300]),
    home: const ToDo(),
  ),
  );
}
