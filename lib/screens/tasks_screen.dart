import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color kMainColor = Color(0xFF00B4FF);

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.only(
                top: 40,
                bottom: 20,
                left: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(vertical: 35),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(36),
                      ),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.format_list_bulleted,
                      color: kMainColor,
                      size: 42,
                    ),
                  ),
                  const Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    '12 Tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              constraints: const BoxConstraints.tightForFinite(),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              child: ListView(
                children: [
                  TaskWidget(
                    text: 'Buy milk ',
                    isActive: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TaskWidget extends StatelessWidget {
  final String? text;
  bool isActive;

  TaskWidget({this.text, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Buy Milk',
          style: TextStyle(
            decoration:
                isActive ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        Checkbox(
            value: isActive,
            onChanged: (bool? value) {
              isActive = value!;
            }),
      ],
    );
  }
}
