import 'package:doto_app/Controllers/ListTaskController.dart';
import 'package:doto_app/Widgets/ListsTask.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets/ModelBottomSheet.dart';

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.teal[400],

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton:  FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
              context: context, builder: (context)=>SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom
              ),
              child: AddTaskScreen()
            ),
          )
          );
        },
        backgroundColor: Colors.indigo,
        child: const Icon(
          Icons.add,color: Colors.white,),
      ),

      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:const
                EdgeInsets.only(
                    top: 60,
                    left: 20,
                    bottom: 30,
                    right: 20) ,
                child: Row(
                  children: const [
                    Icon(
                      Icons.playlist_add_check,
                      size: 40,
                      color: Colors.white,),
                    SizedBox(width: 20,),
                    Text("ToDayDo",style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
              Consumer<ListTaskController>(builder: (context,model,child){
                return Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text("${model.NumberOfTasks==0?"":model.NumberOfTasks} Tasks",style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white),
                    )
                );
              }),
              const SizedBox (height: 20,),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      margin: const EdgeInsets.all(10),
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.white
                      ),
                      child: TasksList()
                  )
              )
            ],
          ),
        ),
    );
  }
}
