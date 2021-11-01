import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';

class Tasks extends ChangeNotifier {
  List<Task> _tasks = [];

  void changeTaskStatus(int index) {
    _tasks[index].changeStatus();
    notifyListeners();
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  int get tasksLength {
    return _tasks.length;
  }

  Task taskByIndex(int index) {
    return _tasks[index];
  }

  void deleteTaskByIndex(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
