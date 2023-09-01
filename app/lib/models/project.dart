import 'dart:async';

class Project {
  final String id;
  String name;
  List<String> members = [];
  String label;
  String accessCode;
  DateTime created;

  Project({
    required this.id,
    required this.name,
    this.members = const [],
    required this.label,
    required this.accessCode,
    required this.created
  });

  factory Project.fromJson(String id, Map<String, dynamic> json) => Project(
    id: id,
    name: json["name"],
    members: List<String>.from(json["members"].keys),
    label: json["label"],
    accessCode: json["access_code"],
    created: json["created"].toDate()
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "members": members,
    "label": label,
    "access_code": accessCode,
    "created": created.toIso8601String()
  };
}

// final projectTransformer = StreamTransformer<QuerySnapshot<Map<String, dynamic>>, List<Project>>.fromHandlers(
//   handleData: (snapshot, sink) {
//     sink.add(snapshot.docs.map((doc) => Project.fromJson(doc.id, doc.data())).toList());
//   }
// );