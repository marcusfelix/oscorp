import 'package:app/includes/dictionary.dart';
import 'package:app/models/project.dart';
import 'package:app/views/components/file_tile.dart';
import 'package:app/views/components/folder_tile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Files extends StatelessWidget {
  const Files({
    super.key,
    required this.project,
    required this.ref
  });

  final Project project;
  final Reference ref;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ref.name == project.id ? translate("files_string") : ref.name),
      ),
      body: FutureBuilder(
        future: ref.listAll(),
        builder: (context, data) {
          List<Reference> files = data.data?.items ?? [];
          List<Reference> folders = data.data?.prefixes ?? [];
          
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ...folders.map((item) => FolderTile(
                  ref: item,
                  project: project
                )).toList(),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  physics: const NeverScrollableScrollPhysics(),
                  children: files.map((item) => FileTile(ref: item)).toList(),
                )
              ],
            ),
          );
        }
      )
    );
  }

}