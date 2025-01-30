import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? updateFunction;
  final Function(BuildContext)? deleteFunction;

  const TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.updateFunction,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
      colors: [
        
        Color.fromARGB(255, 170, 231, 16), // Start color
        Color.fromARGB(255, 242, 239, 234), // End color
      ],
      begin: Alignment.topLeft, // Gradient starts at the top left
      end: Alignment.bottomRight, // Gradient ends at the bottom right
    ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Task Checkbox & Text
            Row(
              children: [
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Color.fromARGB(255, 68, 68, 68),
                ),
                Text(
                  taskName,
                  style: TextStyle(
                    fontSize: 18,
                    decoration: taskCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
              ],
            ),
            
            // Update & Delete Buttons
            Row(
              children: [
                // Edit (Update) Button
                GestureDetector(
                  onTap: () => updateFunction!(context),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
      colors: [
        const Color.fromARGB(255, 47, 46, 46), // Start color
        Color.fromARGB(255, 186, 185, 184), // End color
      ],
      begin: Alignment.topLeft, // Gradient starts at the top left
      end: Alignment.bottomRight, // Gradient ends at the bottom right
    ),// Update color
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 8), // Space between buttons

                // Delete Button
                GestureDetector(
                  onTap: () => deleteFunction!(context),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
      colors: [
        const Color.fromARGB(255, 206, 23, 10), // Start color
        Color.fromARGB(255, 248, 148, 148), // End color
      ],
      begin: Alignment.topLeft, // Gradient starts at the top left
      end: Alignment.bottomRight, // Gradient ends at the bottom right
    ), // Delete color
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
