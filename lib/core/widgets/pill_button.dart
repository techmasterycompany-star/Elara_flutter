import 'package:flutter/material.dart';

class PillButton extends StatelessWidget {
  final String message;
  final VoidCallback? onPressed;
  const PillButton({super.key, required this.message, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return OutlinedButton(onPressed: onPressed, child: Text(
      message, style: textTheme.bodyMedium,
    ));
  }
}