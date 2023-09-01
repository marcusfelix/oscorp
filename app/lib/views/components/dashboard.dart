import 'dart:math';

import 'package:app/models/cash_flow.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
    required this.cashflow,
    required this.dates,
    required this.selected,
    required this.total,
    required this.onSelect
  });

  final List<CashFlow> cashflow;
  final List<DateTime> dates;
  final DateTime selected;
  final int total;
  final Function(DateTime) onSelect;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).viewInsets.top + 112
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 4,
                children: [
                  Text(
                    "${selected.day}/${selected.month}/${selected.year}",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.7),
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    (total / 100).toStringAsFixed(2),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: 36,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: dates.map((date) => bar(
                context: context,
                date: date,
                selected: date.difference(selected).inDays == 0
              )).toList()
            )
          ),
        )
      ],
    );
  }

  Widget bar({ required context, required DateTime date, required bool selected }) {
    List<CashFlow> fromDate = cashflow.where((e) => e.date.difference(date).inDays == 0).toList();
    int total = 0;
    fromDate.forEach((e) {
      total += e.amount;
    });
    // get biggest amount from cashflow
    int all = 0;
    cashflow.forEach((e) {
      all = max(all, e.amount);
    });
    double factor = total / all;

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: AnimatedFractionallySizedBox(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        heightFactor: factor,
        child: Material(
          color: selected ?  Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14)
          ),
          child: InkWell(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14)
            ),
            onTap: () => onSelect(date),
            child: Container(
              width: 44
            ),
          ),
        ),
      ),
    );
  }

}