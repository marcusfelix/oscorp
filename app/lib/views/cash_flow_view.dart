import 'package:app/includes/dictionary.dart';
import 'package:app/models/cash_flow.dart';
import 'package:flutter/material.dart';

class CashFlowView extends StatelessWidget {
  CashFlowView({
    super.key,
    required this.cashflow
  });

  final CashFlow cashflow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              AspectRatio(
                aspectRatio: 4 / 3,
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "${cashflow.date.day}/${cashflow.date.month}/${cashflow.date.year}",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.7),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Wrap(
                      spacing: 12,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          (cashflow.amount / 100).toStringAsFixed(2),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                            fontSize: 36,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: cashflow.exit ? Theme.of(context).colorScheme.errorContainer : Theme.of(context).colorScheme.primaryContainer,
                          ),
                          child: Icon(
                            cashflow.exit ? Icons.arrow_outward_outlined : Icons.arrow_downward_outlined, 
                            size: 20,
                            color: cashflow.exit ? Theme.of(context).colorScheme.onErrorContainer : Theme.of(context).colorScheme.onPrimaryContainer,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      cashflow.description ?? "",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.7),
                        fontSize: 16
                      ),
                    )
                  ],
                ),
              )
              
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: AppBar(
              leading: IconButton(
                onPressed: () => Navigator.pop(context), 
                icon: const Icon(Icons.close)
              ),
              backgroundColor: Colors.transparent,
              title: Text(translate("cash-flow")),
              flexibleSpace: Container(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.close_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}