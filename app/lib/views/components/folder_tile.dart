import 'package:app/models/project.dart';
import 'package:app/views/files.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FolderTile extends StatelessWidget {
  const FolderTile({
    super.key,
    required this.project,
    required this.ref
  });

  final Project project;
  final Reference ref;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Files(
          ref: ref,
          project: project
        )));
      },
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        child: Icon(
          Icons.folder_outlined, 
          size: 20,
          color: Theme.of(context).colorScheme.onSecondaryContainer
        )
      ),
      title: Text(
        ref.name,
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