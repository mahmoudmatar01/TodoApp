import 'package:doto_app/Controllers/ListTaskController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Consumer<ListTaskController>(builder: (context, model, child) {
      return ListView.separated(
        separatorBuilder: (context, index) =>
          const Divider(color: Colors.black54,thickness: 2),
          itemCount: model.NumberOfTasks,
          itemBuilder: (context, i) {
            return  ListTile(
                    title: Text(model.GetTaskList[i].title,style: TextStyle(
                      fontSize: 20,
                        decoration: model.GetTaskList[i].isDone==true?TextDecoration.lineThrough:null,
                        color: Colors.black54,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    trailing: Checkbox(
                      activeColor: Colors.teal[400],
                      value: model.GetTaskList[i].isDone,
                      onChanged: (val) {
                        model.OnChange(val);
                        model.GetTaskList[i].isDone=val!;
                      },
                    ),
                    onLongPress: (){
                      model.RemoveTask(model.tasks[i]);
                    },
            );
          });
    });
  }
}