import 'package:flutter/material.dart';
import 'package:my_project/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  const DialogBox({super.key, required this.controller,});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          //get user input
          TextField(
            controller: controller,
            decoration:InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add a new task",
              )
          ),

          //buttons -> save + cancel
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            //save button
            MyButton(text: "Save", onPressed: () {}),
            const SizedBox(width: 8),
            ColoredBox(color: Colors.yellow),
            //cancel button
            MyButton(text: "Cancel", onPressed: () {}),
          ],)
        ],
        ),
      ),
    );
  }
}