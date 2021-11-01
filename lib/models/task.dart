import 'package:flutter/widgets.dart';

class Task extends ChangeNotifier {
  String name;
  bool isActive;

  Task({required this.name, this.isActive = false});

  void changeStatus() {
    isActive = !isActive;
  }
}
