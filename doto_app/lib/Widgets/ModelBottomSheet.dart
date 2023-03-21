import 'package:doto_app/Controllers/ListTaskController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget{

  //to get text from Text Form Field
  String ?TextForm;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>ListTaskController(),
    child: Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("Add Task",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 28,
                color: Colors.indigo,
                fontWeight: FontWeight.bold
            ),),
          TextFormField(
            onFieldSubmitted: (val){
              TextForm=val;
              Provider.of<ListTaskController>(context,listen: false).AddTask(TextForm!);
              Navigator.pop(context);
            },
            onChanged: (val){
              TextForm=val;
            },
            textAlign: TextAlign.center,
            autofocus: true,
            autocorrect: true,
            decoration: const InputDecoration(
                label: Text("Task"),
                hintText: "Add Task",
            ),
          ),
          const SizedBox(height: 30,),

         InkWell(
              onTap:(){
                Provider.of<ListTaskController>(context,listen: false)
                    .AddTask(TextForm!);
                  Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius:const BorderRadius.all(Radius.circular(25)),
                    color: Colors.teal[400]
                ),
                child: const Text("Add",style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),),
              )
         )
        ],
      ),
     )
    );
  }
}