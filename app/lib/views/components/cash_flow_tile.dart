import 'package:app/models/cash_flow.dart';
import 'package:app/views/cash_flow_view.dart';
import 'package:flutter/material.dart';

class CashFlowTile extends StatelessWidget {
  const CashFlowTile({
    super.key,
    required this.cashFlow
  });

  final CashFlow cashFlow;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          ),
          backgroundColor: Colors.white,
          isScrollControlled: true,
          context: context, 
          builder: (context) => ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: CashFlowView(
                cashflow: cashFlow,
              ),
            ),
          )
        );
      },
      leading: CircleAvatar(
        backgroundColor: cashFlow.exit ? Theme.of(context).colorScheme.errorContainer : Theme.of(context).colorScheme.secondaryContainer,
        child: Icon(
          cashFlow.exit ? Icons.arrow_outward_outlined : Icons.arrow_downward_outlined, 
          size: 20,
          color: cashFlow.exit ? Theme.of(context).colorScheme.onErrorContainer : Theme.of(context).colorScheme.onSecondaryContainer,
        )
      ),
      title: Text(
        cashFlow.description ?? "",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(8)
        ),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Text(
          (cashFlow.amount / 100).toStringAsFixed(2),
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.1
          ),
        ),
      ),
    );
  }

}