import 'package:flutter/material.dart';

class SlugButton extends StatelessWidget {
  const SlugButton({
    super.key,
    required this.text,
    this.secondaryText,
    required this.selected,
    required this.onSelect
  });

  final String text;
  final String? secondaryText;
  final bool selected;
  final Function(String) onSelect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Material(
        shape: const StadiumBorder(),
        color: selected ? Theme.of(context).colorScheme.onTertiaryContainer : Colors.transparent,
        child: InkWell(
          onTap: () => onSelect(text),
          customBorder: const StadiumBorder(),
          child: Container(
            padding: secondaryText != null ? const EdgeInsets.fromLTRB(18, 0, 12, 0) : const EdgeInsets.symmetric(horizontal: 18),
            alignment: Alignment.center,
            child: Wrap(
              spacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: selected ? Theme.of(context).colorScheme.primaryContainer : Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                if (secondaryText != null) Container(
                  decoration: BoxDecoration(
                    color: selected ? Theme.of(context).colorScheme.primaryContainer : Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Text(
                    secondaryText!,
                    style: TextStyle(
                      color: selected ? Theme.of(context).colorScheme.onPrimaryContainer : Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.8),
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}