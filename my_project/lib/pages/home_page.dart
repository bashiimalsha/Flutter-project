
import 'package:flutter/material.dart';
import 'package:my_project/util/dialog_box.dart';
import 'package:my_project/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //text controller
  final _controller = TextEditingController();

  //list of todo tasks
  List toDoList = [
    ["Make Tutorial", false],
    ["Do Exercise", false],
    ["Warship", false],

  ];
  //checkbox was tapped
  void CheckBoxChanged(bool? value,int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });

  }
  //create a new task
  void createNewTask() {
    showDialog(
    context: context, 
    builder: (context){
      return DialogBox(
        controller: _controller,
      );
    }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text('To Do'),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 255, 235, 59),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
      
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index){
          return TodoTile(
            taskName: toDoList[index][0], 
            taskCompleted: toDoList[index][1], 
            onChanged: (value) => CheckBoxChanged(value, index),
            );
        }
      ),

    );

  }
}