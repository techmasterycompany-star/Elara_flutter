import 'package:flutter/material.dart';

class PillButton extends StatelessWidget {
  final String message;
  final VoidCallback? onPressed;
  final bool isSelected;
  const PillButton({
    super.key,
    required this.message,
    this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected ? colorTheme.onSurface : colorTheme.surface,
        side: BorderSide(color: colorTheme.onSurface),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      child: Text(
        message,
        style: textTheme.bodyMedium?.copyWith(
          color: isSelected ? colorTheme.surface : colorTheme.onSurface,
        ),
      ),
    );
  }
}
