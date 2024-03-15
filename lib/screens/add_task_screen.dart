import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

String? newTaskTitle;

class AddTaskScreen extends StatelessWidget {
  final int? index;

  AddTaskScreen({this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            index == null ? 'Add Task' : 'Edit Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 33,
              color: Colors.lightBlueAccent,
            ),
          ),
          TextField(
            textAlign: TextAlign.center,
            autofocus: true,
            onChanged: (newText) {
              newTaskTitle = newText;
              print('newTasktitle0: $newTaskTitle');
            },
          ),
          const SizedBox(
            height: 22,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.lightBlueAccent,
            ),
            onPressed: () {
              print('newTasktitle1: $newTaskTitle');
              index == null
                  ? Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle)
                  : Provider.of<TaskData>(context, listen: false)
                      .editTask(index!, newTaskTitle!);
              Navigator.pop(context);
            },
            child: Text(
              index == null ? 'Add' : 'Edit',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
