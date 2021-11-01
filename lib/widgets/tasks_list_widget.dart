import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/tasks.dart';
import 'package:todoey_flutter/widgets/task_widget.dart';
import 'package:provider/provider.dart';

class TasksListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Tasks>(
      builder: (BuildContext context, Tasks tasksValue, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskWidget(
              text: tasksValue.taskByIndex(index).name,
              isActive: tasksValue.taskByIndex(index).isActive,
              onChangedCheckboxStatus: (bool value) {
                tasksValue.changeTaskStatus(index);
              },
            );
          },
          itemCount: tasksValue.tasksLength,
        );
      },
    );
  }
}
