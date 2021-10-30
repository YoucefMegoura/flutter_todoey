import 'package:flutter/material.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';

class TaskWidget extends StatefulWidget {
  final String? text;
  bool isActive = false;

  TaskWidget({this.text, required this.isActive});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Buy Milk',
          style: TextStyle(
            decoration: widget.isActive
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        Checkbox(
            value: widget.isActive,
            onChanged: (bool? value) {
              setState(() {
                widget.isActive = value!;
                TasksScreen.taskCount--;
              });
            }),
      ],
    );
  }
}
