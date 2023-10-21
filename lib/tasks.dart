import 'package:uuid/uuid.dart';

// Creates a Uuid object for generating unique IDs.
const uuid = Uuid();

class Task {
  Task({
    required this.title,
    required this.task,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final String task;
}
