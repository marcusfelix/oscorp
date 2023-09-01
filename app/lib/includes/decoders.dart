
import 'package:app/models/cash_flow.dart';
import 'package:app/models/project.dart';
import 'package:app/models/task.dart';

final decoders = {
  Project: (dynamic data) => Project.fromJson(data.id, data),
  CashFlow: (dynamic data) => CashFlow.fromJson(data.id, data),
  Task: (dynamic data) => Task.fromJson(data.id, data)
};

final encoders = {
  Project: (dynamic data) => (data as Project).toJson(),
  CashFlow: (dynamic data) => (data as CashFlow).toJson(),
  Task: (dynamic data) => (data as Task).toJson()
};