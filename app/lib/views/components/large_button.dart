import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  const LargeButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.working
  });

  final String label;
  final VoidCallback onPressed;
  final bool? working;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.onBackground,
      shape: const StadiumBorder(),
      child: InkWell(
        onTap: () => onPressed(),
        customBorder: const StadiumBorder(),
        child: Container(
          height: 54,
          alignment: Alignment.center,
          child: working != null && working! ? SizedBox(
            width: 32,
            height: 32,
            child: CircularProgressIndicator(
              strokeWidth: 3, 
              valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.background)
            ),
          ) : Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.background
            )
          ),
        ),
      ),
    );
  }

}