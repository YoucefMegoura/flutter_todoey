import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey_flutter/components/task_widget.dart';
import 'package:todoey_flutter/models/task.dart';

const Color kMainColor = Color(0xFF00B4FF);
const Decoration kMainWhiteDecorationContainer = BoxDecoration(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30),
    topRight: Radius.circular(30),
  ),
  color: Colors.white,
);

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
      tmpList.add(TaskWidget(text: task.name, isActive: task.isActive));
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
              padding: const EdgeInsets.only(
                top: 70,
                left: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      color: kMainColor,
                      size: 42,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              decoration: kMainWhiteDecorationContainer,
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
