import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier{
  // private field
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  // getter of private field called '_tasks'

  // List<Task> get tasks{
  //   return _tasks;
  // }

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  int get taskCount{
    return _tasks.length;
  }

  void addTask(String newTask){
    final task = Task(name: newTask);
    _tasks.add(task);
    // to update
    notifyListeners();
  }
}