import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color kMainColor = Color(0xFF00B4FF);

class TasksScreen extends StatefulWidget {
  static int taskCount = 0;

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> _taskList = [];

  List<TaskWidget> getTaskWidget() {
    List<TaskWidget> tmpList = [];
    for (Task task in _taskList) {
      tmpList.add(
        TaskWidget(
          isActive: task.isActive,
          text: task.name,
        ),
      );
    }
    return tmpList;
  }

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
                  Text(
                    '${TasksScreen.taskCount.toString()} Tasks',
                    style: const TextStyle(
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
                children: getTaskWidget(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _taskList.add(Task(isActive: false, name: 'Hello world'));
            TasksScreen.taskCount++;
          });
        },
        child: const Icon(Icons.add),
        backgroundColor: kMainColor,
      ),
    );
  }
}

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

class Task {
  String name;
  bool isActive;

  Task({required this.name, required this.isActive});
}
