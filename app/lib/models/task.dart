import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String id;
  String name;
  double progress;
  String? description;
  String? category;
  DateTime? start;
  DateTime? end;
  DateTime created;

  Task({
    required this.id,
    required this.name,
    this.description,
    this.progress = 0.0,
    this.category,
    this.start,
    this.end,
    required this.created,
  });

  factory Task.fromJson(String id, Map<String, dynamic> json) {
    return Task(
      id: id,
      name: json['name'],
      description: json['description'],
      progress: json['progress'],
      category: json['category'],
      start: json['start'].toDate(),
      end: json['end'] != null ? json['end']!.toDate() : null,
      created: json['created'].toDate()
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'progress': progress,
      'category': category,
      'start': start?.toIso8601String(),
      'end': end?.toIso8601String(),
      'created': created.toIso8601String(),
    };
  }
}

enum TaskType {
  plan,
  execution,
  revision,
}

final taskTransformer = StreamTransformer<QuerySnapshot<Map<String, dynamic>>, List<Task>>.fromHandlers(
  handleData: (snapshot, sink) {
    try {
      sink.add(snapshot.docs.map<Task>((doc) => Task.fromJson(doc.id, doc.data())).toList());
    } catch(e){
      print(e);
    }
    
  }
);