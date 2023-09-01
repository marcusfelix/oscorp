import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class CashFlow {
  final String id;
  int amount;
  bool exit;
  // String statement;
  String? category;
  String? description;
  Map<String, dynamic> metadata = {};
  DateTime date;
  DateTime created;

  CashFlow({
    required this.id,
    required this.amount,
    required this.exit,
    // required this.statement,
    this.category,
    this.description,
    this.metadata = const {},
    required this.date,
    required this.created
  });

  factory CashFlow.fromJson(String id, Map<String, dynamic> json) => CashFlow(
    id: id,
    amount: json["amount"],
    exit: json["exit"],
    // statement: json["statement"],
    category: json["category"],
    description: json["description"],
    metadata: json["metadata"],
    date: json["date"].toDate(),
    created: json["created"].toDate()
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "amount": amount,
    "exit": exit,
    // "statement": statement,
    "category": category,
    "description": description,
    "metadata": metadata,
    "date": date.toIso8601String(),
    "created": created.toIso8601String()
  };
}

final cashflowTransformer = StreamTransformer<QuerySnapshot<Map<String, dynamic>>, List<CashFlow>>.fromHandlers(
  handleData: (snapshot, sink) {
    try {
      sink.add(snapshot.docs.map((doc) => CashFlow.fromJson(doc.id, doc.data())).toList());
    } catch(e){
      print(e);
    }
  }
);