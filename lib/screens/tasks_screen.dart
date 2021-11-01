import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/tasks.dart';
import 'package:todoey_flutter/widgets/tasks_list_widget.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/utils/constants.dart';
import 'package:todoey_flutter/screens/addtask_screen.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Tasks>(
      create: (context) => Tasks(),
      builder: (context, widget) => Scaffold(
        resizeToAvoidBottomInset: false,
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
                      '${context.watch<Tasks>().tasks.length} Tasks',
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
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                decoration: kMainWhiteDecorationContainer,
                child: TasksListWidget(),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var result = await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.black12,
              shape: kMainPopupShape,
              context: context,
              builder: (context) => SingleChildScrollView(
                  child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              )),
            );
            if (result == null || result['taskName'] == null) {
              return;
            }
            context.read<Tasks>().addTask(
                  Task(
                    name: result['taskName'],
                  ),
                );
          },
          child: const Icon(Icons.add),
          backgroundColor: kMainColor,
        ),
      ),
    );
  }
}
