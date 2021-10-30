import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';
import 'package:todoey_flutter/utils/constants.dart';
import 'package:todoey_flutter/widgets/task_widget.dart';

class TasksListWidget extends StatefulWidget {
  List<Task> taskList = [];
  List<TaskWidget> _listTaskWidget = [];

  TasksListWidget({required this.taskList}) {
    for (var task in taskList) {
      _listTaskWidget.add(
        TaskWidget(
          text: task.name,
          isActive: task.isActive,
        ),
      );
    }
  }

  @override
  State<TasksListWidget> createState() => _TasksListWidgetState();
}

class _TasksListWidgetState extends State<TasksListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: widget._listTaskWidget);
  }
}
