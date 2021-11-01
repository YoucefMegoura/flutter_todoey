import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/tasks.dart';
import 'package:todoey_flutter/widgets/task_widget.dart';
import 'package:provider/provider.dart';

class TasksListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskWidget(
          text: context.watch<Tasks>().tasks[index].name,
          isActive: context.watch<Tasks>().tasks[index].isActive,
          onChangedCheckboxStatus: (bool value) {
            context.read<Tasks>().changeTaskStatus(index);
          },
        );
      },
      itemCount: context.watch<Tasks>().tasks.length,
    );
  }
}
