import 'package:flutter/material.dart';
import 'package:todoey_flutter/utils/constants.dart';

class TaskWidget extends StatelessWidget {
  String text;
  bool isActive;
  Function onChangedCheckboxStatus;
  Function onLongPress;

  TaskWidget(
      {required this.text,
      required this.isActive,
      required this.onChangedCheckboxStatus,
      required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        onLongPress();
      },
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
