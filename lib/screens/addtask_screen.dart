import 'package:flutter/material.dart';
import 'package:todoey_flutter/utils/constants.dart';

Widget AddTaskScreen(BuildContext context) {
  String? _taskName;
  return Container(
    height: 200,
    padding: const EdgeInsets.all(20.0),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextField(
            textAlign: TextAlign.center,
            autofocus: true,
            onChanged: (value) {
              _taskName = value.toString();
            },
            decoration: kMainInputDecoration),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Material(
            elevation: 5.0,
            color: Colors.blue,
            borderRadius: BorderRadius.circular(36.0),
            child: MaterialButton(
              onPressed: () {
                Navigator.pop(context, {'taskName': _taskName});
              },
              minWidth: 200.0,
              height: 42.0,
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
