import 'package:flutter/material.dart';
import 'package:todoey/screens/add_task_screen.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String? taskTitle;
  final Function(bool?)? checkboxCallback;
  final Function() removeCallback;
  final int index;

  TaskTile({
    this.taskTitle,
    required this.isChecked,
    this.checkboxCallback,
    required this.removeCallback,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (direction) {
        if (direction == DismissDirection.endToStart) {
          return removeCallback();
        } else {
          return showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(index: index),
          );
        }
      },
      background: Container(
        padding: EdgeInsets.symmetric(horizontal: 13),
        color: Colors.blue,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.edit,
            color: Colors.white,
          ),
        ),
      ),
      secondaryBackground: Container(
        padding: EdgeInsets.symmetric(horizontal: 13),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      key: Key(index.toString()),
      child: ListTile(
        // onLongPress: removeCallback,
        title: Text(
          taskTitle!,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: checkboxCallback,
        ),
      ),
    );
  }
}
