import 'package:flutter/material.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';

class TaskWidget extends StatefulWidget {
  final String text;
  bool isActive = false;

  TaskWidget({required this.text, required this.isActive});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.text),
      trailing: Checkbox(
        value: widget.isActive,
        activeColor: kMainColor,
        onChanged: (bool? value) {
          setState(() {
            widget.isActive = value!;
            TasksScreen.taskCount--;
          });
        },
      ),
    );
  }
}
