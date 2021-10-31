import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/widgets/task_widget.dart';

class TasksListWidget extends StatefulWidget {
  List<Task> taskList = [];

  TasksListWidget(this.taskList);

  @override
  State<TasksListWidget> createState() => _TasksListWidgetState();
}

class _TasksListWidgetState extends State<TasksListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskWidget(
          text: widget.taskList[index].name,
          isActive: widget.taskList[index].isActive,
          onChangedCheckboxStatus: (bool? value) {
            setState(() {
              widget.taskList[index].isActive =
                  !widget.taskList[index].isActive;
            });
          },
        );
      },
      itemCount: widget.taskList.length,
    );
  }
}
