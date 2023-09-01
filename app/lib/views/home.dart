import 'package:app/models/project.dart';
import 'package:app/views/files.dart';
import 'package:app/views/finance.dart';
import 'package:app/views/progress.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
    required this.project
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            TabBarView(
              children: [
                Finance(
                  project: project
                ),
                Progress(
                  project: project
                ),
                Files(
                  project: project,
                  ref: FirebaseStorage.instance.ref("projects/${project.id}")
                )
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(16, 16, 16, MediaQuery.of(context).viewInsets.bottom + 32),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Theme.of(context).colorScheme.background, Theme.of(context).colorScheme.background.withOpacity(0)],
                    begin: Alignment.center,
                    end: Alignment.topCenter
                  )
                ),
                alignment: Alignment.center,
                child: Container(
                  width: 240,
                  height: 54,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    borderRadius: BorderRadius.circular(28)
                  ),
                  child: const TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.pie_chart_outline)),
                      Tab(icon: Icon(Icons.task_alt_outlined)),
                      Tab(icon: Icon(Icons.grid_view_outlined)),
                    ],
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}