import 'package:app/includes/mock.dart';
import 'package:app/includes/utils.dart';
import 'package:app/models/cash_flow.dart';
import 'package:app/models/project.dart';
import 'package:app/views/components/cash_flow_tile.dart';
import 'package:app/views/components/slug_button.dart';
import 'package:app/views/components/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Finance extends StatefulWidget {
  const Finance({
    super.key,
    required this.project
  });

  final Project project;

  @override
  State<Finance> createState() => _FinanceState();
}

class _FinanceState extends State<Finance> {
  DateTime _date = DateTime.now();
  String _category = "Cash flow";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<CashFlow>>(
        stream: FirebaseFirestore.instance.collection("projects").doc(widget.project.id).collection("cashflow").snapshots().transform(cashflowTransformer),
        //stream: Stream.value(cashflows),
        builder: (context, cashflow) {
          List<CashFlow> filted = (cashflow.data ?? []).where((e) => _category == e.category).toList();
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                pinned: true,
                primary: true,
                expandedHeight: MediaQuery.of(context).size.height * 0.45,
                flexibleSpace: FlexibleSpaceBar(
                  background: Dashboard(
                    cashflow: filted,
                    dates: dates(filted),
                    selected: _date,
                    total: total(filted),
                    onSelect: (DateTime date) => setState(() => _date = date),
                  ),
                ),
                leading: IconButton(
                  onPressed: (){}, 
                  icon: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.background,
                    child: Text(
                      "M",
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                ),
                actions: [
                  IconButton(
                    onPressed: (){}, 
                    icon: const Icon(Icons.settings_outlined)
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
                      children: categories(cashflow.data ?? []).map((String category) => SlugButton(
                        text: category,
                        selected: _category == category,
                        onSelect: (String key) => setState(() => _category = category),
                      )).toList()
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => CashFlowTile(
                    cashFlow: (filted).elementAt(index)
                  ),
                  childCount: (filted).length
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