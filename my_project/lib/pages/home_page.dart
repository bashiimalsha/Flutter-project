import 'package:flutter/material.dart';
import 'package:my_project/util/dialog_box.dart';
import 'package:my_project/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List toDoList = [
    ["Working on projects", false],
    ["Practicing coding skills", false],
    ["Do exersice", false],
  ];

  // Checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // Save new task
  void saveNewTask() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        toDoList.add([_controller.text, false]);
      }
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // Create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // Delete task
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  // Update existing task
  void updateTask(int index) {
    _controller.text = toDoList[index][0]; // Pre-fill the text field

    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: () {
            setState(() {
              toDoList[index][0] = _controller.text;
              _controller.clear();
            });
            Navigator.of(context).pop();
          },
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 255, 204),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 170, 231, 16),
        elevation: 1,
        centerTitle: true, // Ensures title is centered
        title: const Text(
          'To Do',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            updateFunction: (context) => updateTask(index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),

      // ✅ Floating Action Button (FAB) added here
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Color.fromARGB(255, 170, 231, 16), // Matches AppBar color
        elevation: 5, // Adds shadow effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50), // Makes it circular
        ),
        child: const Icon(
          Icons.add,
          size: 30,
          color: Color.fromARGB(255, 90, 90, 90), // White icon for contrast
        ),
      ),
    );
  }
}
