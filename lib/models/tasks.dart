import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';

class Tasks extends ChangeNotifier {
  List<Task> tasks = [];

  void changeTaskStatus(int index) {
    tasks[index].changeStatus();
    notifyListeners();
  }

  void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }
}
