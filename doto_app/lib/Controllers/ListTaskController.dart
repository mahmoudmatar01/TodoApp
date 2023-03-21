import 'package:flutter/cupertino.dart';
import '../Models/Task.dart';


class ListTaskController with ChangeNotifier{

  //check Variable To CheckBox
  List<Tasks> tasks=[];

  //Add Task To TasksList
  AddTask(String tasktitle){
    tasks.add(new Tasks(title: tasktitle));
    notifyListeners();
  }


  //Remove Task From List
  RemoveTask(Tasks task){
    tasks.remove(task);
    notifyListeners();
  }

  //onChange
  OnChange(bool?val){
    val=!val!;
    notifyListeners();
  }

  int get NumberOfTasks=>tasks.length;
  List<Tasks> get GetTaskList => tasks;

}