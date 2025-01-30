import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(181, 236, 249, 222), // Make background transparent
      title: const Text("Add Task"),
      content: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 170, 231, 16), // Start color
              Color.fromARGB(255, 242, 239, 234), // End color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12), // Optional: rounded corners
        ),
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: "Enter task...",
            border: OutlineInputBorder(),
            filled: true, // Ensures the background color is filled
            fillColor: Color.fromARGB(0, 0, 0, 0), // Make the TextField transparent
          ),
        ),
      ),
      actions: [
        // Cancel button
        TextButton(
          onPressed: onCancel,
          child: const Text(
            "Cancel",
            style: TextStyle(color: Color.fromARGB(255, 204, 37, 25), fontSize: 16),
          ),
        ),
        // Save button
        TextButton(
          onPressed: onSave,
          child: const Text("Save", style: TextStyle(color: Colors.green, fontSize: 16)),
        ),
      ],
    );
  }
}
