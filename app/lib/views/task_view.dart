import 'package:app/includes/dictionary.dart';
import 'package:app/models/task.dart';
import 'package:flutter/material.dart';

class TaskView extends StatelessWidget {
  TaskView({
    super.key,
    required this.task
  });

  final Task task;

  final DateTime selected = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context), 
          icon: const Icon(Icons.close)
        ),
        title: Text(translate("task")),
        flexibleSpace: Container(),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Text(
                    (task.category ?? "").toUpperCase(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  task.name,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  task.description ?? "",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.7),
                    fontSize: 16
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    task.start != null ? Text(
                      "${task.start!.day}/${task.start!.month}/${task.start!.year}",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ) : Container(),
                    const Expanded(
                      child: Divider(
                        indent: 12,
                        endIndent: 12,
                      ),
                    ),
                    task.end != null ? Text(
                      "${task.end!.day}/${task.end!.month}/${task.end!.year}",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ) : Container(),
                  ],
                ),
              ],
            ),
          )
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.close_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}