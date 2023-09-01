import 'package:app/controllers/theme_controller.dart';
import 'package:app/models/project.dart';
import 'package:app/views/auth.dart';
import 'package:app/views/home.dart';
import 'package:app/views/onboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "OS CORP",
      theme: theme,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, user) {
          if(user.connectionState == ConnectionState.waiting){
            return Container(
              color: Theme.of(context).colorScheme.background,
            );
          }
          if(!user.hasData){
            return const Auth();
          }
          return StreamBuilder(
            stream: FirebaseFirestore.instance.collection("projects").where("members.${user.data!.uid}", isNull: false).snapshots(),
            builder: (context, projects) {
              if((projects.data?.docs ?? []).isEmpty){
                return const Onboard();
              }
              final project = (projects.data?.docs ?? []).first;
              return Home(
                project: Project.fromJson(project.id, project.data())
              );
            }
          );
        }
      ),
    );
  }
}