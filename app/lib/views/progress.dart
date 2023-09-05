import 'package:app/includes/dictionary.dart';
import 'package:app/includes/mock.dart';
import 'package:app/includes/utils.dart';
import 'package:app/models/project.dart';
import 'package:app/models/task.dart';
import 'package:app/views/components/radial_graph.dart';
import 'package:app/views/components/slug_button.dart';
import 'package:app/views/components/task_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Progress extends StatefulWidget {
  const Progress({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  String _selected = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Task>>(
        stream: FirebaseFirestore.instance.collection("projects").doc(widget.project.id).collection("tasks").snapshots().transform(taskTransformer),
        //stream: Stream.value(tasks),
        builder: (context, tasks) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height * 0.45,
                pinned: true,
                primary: true,
                title: Text(translate("progress_string")),
                flexibleSpace: FlexibleSpaceBar(
                  background: RadialGraph(
                    project: widget.project,
                    tasks: tasks.data ?? [],
                  )
                ),
                actions: [
                  IconButton(
                    onPressed: (){}, 
                    icon: const Icon(Icons.add_outlined)
                  )
                ],
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 48,
                  margin: const EdgeInsets.symmetric(vertical: 32),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: categories(tasks.data ?? []).map((category) => SlugButton(
                        text: category,
                        secondaryText: "${(tasks.data ?? []).where((e) => e.progress == 1.0).length}/${(tasks.data ?? []).where((e) => e.category == category).length}",
                        selected: _selected == category,
                        onSelect: (String key) => setState(() => _selected = key),
                      )).toList(),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => TaskTile(
                    task: (tasks.data ?? []).elementAt(index),
                  ),
                  childCount: (tasks.data ?? []).length
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 100,
                )
              )
            ],
          );
        }
      ),
    );
  }
}