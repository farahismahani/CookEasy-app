import 'package:flutter/material.dart';

class TaskCard {
  final String title;
  final String image;

  TaskCard({required this.title, required this.image});
}

class TaskCardWidget extends StatelessWidget {
  final TaskCard task;

  const TaskCardWidget({required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Image.asset(
          task.image,
          width: 40,
          height: 40,
        ),
        title: Text(task.title),
      ),
    );
  }
}
