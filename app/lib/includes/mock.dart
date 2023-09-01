import 'package:app/models/cash_flow.dart';
import 'package:app/models/task.dart';

List<CashFlow> cashflows = [
  CashFlow(
    id: "", 
    amount: 1500000 , 
    exit: false, 
    category: "Cash flow",
    description: "Initial cash support",
    date: DateTime.now(), 
    created: DateTime.now()
  ),
  CashFlow(
    id: "", 
    amount: 1500 , 
    exit: true, 
    category: "Materials",
    description: "Bolts and nuts",
    date: DateTime.now().add(const Duration(days: 1)), 
    created: DateTime.now()
  ),
  CashFlow(
    id: "", 
    amount: 900 , 
    exit: true, 
    category: "Materials",
    description: "Zip ties",
    date: DateTime.now().add(const Duration(days: 2)), 
    created: DateTime.now()
  ),
  CashFlow(
    id: "", 
    amount: 2500, 
    exit: true, 
    category: "Materials",
    description: "Hammer x1",
    date: DateTime.now().add(const Duration(days: 3)), 
    created: DateTime.now()
  ),
  CashFlow(
    id: "", 
    amount: 800, 
    exit: true, 
    category: "Materials",
    description: "Screwdriver x1",
    date: DateTime.now().add(const Duration(days: 4)), 
    created: DateTime.now()
  ),
  CashFlow(
    id: "", 
    amount: 1800, 
    exit: true, 
    category: "Materials",
    description: "Soldering iron x1",
    date: DateTime.now().add(const Duration(days: 5)), 
    created: DateTime.now()
  ),
  CashFlow(
    id: "", 
    amount: 500, 
    exit: true, 
    category: "Materials",
    description: "Soldering wire x1",
    date: DateTime.now().add(const Duration(days: 6)), 
    created: DateTime.now()
  ),
  CashFlow(
    id: "", 
    amount: 1000, 
    exit: true, 
    category: "Materials",
    description: "Tapeline x1",
    date: DateTime.now().add(const Duration(days: 7)), 
    created: DateTime.now()
  ),
];

List<Task> tasks = [
  Task(
    id: "", 
    name: "Walls", 
    category: "Foundation",
    progress: 1.0,
    created: DateTime.now(),
  ),
  Task(
    id: "", 
    name: "Roof", 
    category: "Foundation",
    progress: 1.0,
    created: DateTime.now(),
  ),
  Task(
    id: "", 
    name: "Windows", 
    category: "Foundation",
    progress: 1.0,
    created: DateTime.now(),
  ),
  Task(
    id: "", 
    name: "Doors", 
    category: "Foundation",
    progress: 0.5,
    created: DateTime.now(),
  ),
  Task(
    id: "", 
    name: "Painting", 
    category: "Finishing",
    progress: 0.0,
    created: DateTime.now(),
  ),
  Task(
    id: "", 
    name: "Flooring", 
    category: "Finishing",
    progress: 0.0,
    created: DateTime.now(),
  ),
  Task(
    id: "", 
    name: "Furniture", 
    category: "Finishing",
    progress: 0.0,
    created: DateTime.now(),
  ),
  Task(
    id: "", 
    name: "Pipe fitting", 
    category: "Plumbing",
    progress: 0.7,
    created: DateTime.now(),
  ),
  Task(
    id: "", 
    name: "Water tank", 
    category: "Plumbing",
    progress: 0.0,
    created: DateTime.now(),
  ),
  Task(
    id: "", 
    name: "Water pump", 
    category: "Plumbing",
    progress: 0.0,
    created: DateTime.now(),
  ),
  Task(
    id: "", 
    name: "Cablings", 
    category: "Electrical",
    progress: 0.3,
    created: DateTime.now(),
  ),
  Task(
    id: "", 
    name: "Switches", 
    category: "Electrical",
    progress: 0.0,
    created: DateTime.now(),
  ),
  Task(
    id: "", 
    name: "Bulbs", 
    category: "Electrical",
    progress: 0.0,
    created: DateTime.now(),
  ),
  Task(
    id: "", 
    name: "Sockets", 
    category: "Electrical",
    progress: 0.0,
    created: DateTime.now(),
  ),
];