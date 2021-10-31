import 'package:flutter/material.dart';
import 'package:todoey_flutter/utils/constants.dart';

class TaskWidget extends StatelessWidget {
  String text;
  bool isActive;
  Function onChangedCheckboxStatus;

  TaskWidget({
    required this.text,
    required this.isActive,
    required this.onChangedCheckboxStatus,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
            decoration:
                isActive ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: Checkbox(
        value: isActive,
        activeColor: kMainColor,
        onChanged: (bool? value) {
          onChangedCheckboxStatus(value);
        },
      ),
    );
  }
}
