import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
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
            Task task = tasksValue.taskByIndex(index);
            return GestureDetector(
              onLongPress: () {
                tasksValue.deleteTaskByIndex(index);
              },
              child: TaskWidget(
                text: task.name,
                isActive: task.isActive,
                onChangedCheckboxStatus: (bool value) {
                  tasksValue.changeTaskStatus(index);
                },
              ),
            );
          },
          itemCount: tasksValue.tasksLength,
        );
      },
    );
  }
}
