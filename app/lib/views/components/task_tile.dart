import 'package:app/models/task.dart';
import 'package:app/views/task_view.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          ),
          backgroundColor: Colors.white,
          isScrollControlled: true,
          context: context, 
          builder: (context) => ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: TaskView(
                task: task
              ),
            ),
          )
        );
      },
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        child: Icon(
          Icons.check_circle_outline_outlined, 
          size: 20,
          color: Theme.of(context).colorScheme.onSecondaryContainer
        )
      ),
      title: Text(
        task.name,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
      ),
      trailing: Icon(
        Icons.chevron_right_outlined, 
        size: 20,
        color: Theme.of(context).colorScheme.onSecondaryContainer
      )
    );
  }

}