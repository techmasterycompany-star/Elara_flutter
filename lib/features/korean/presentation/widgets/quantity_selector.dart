import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

/// Compact `-` / value / `+` stepper used to choose the amount to buy.
class QuantitySelector extends StatelessWidget {
  const QuantitySelector({
    super.key,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  final int value;
  final int min;
  final int max;
  final ValueChanged<int> onChanged;

  bool get _canDecrement => value > min;
  bool get _canIncrement => value < max;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: colorTheme.onSurface),
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _StepperButton(
            icon: Icons.remove,
            enabled: _canDecrement,
            onPressed: () => onChanged(value - 1),
          ),
          SizedBox(
            width: AppSpacing.xl,
            child: Text(
              '$value',
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge,
            ),
          ),
          _StepperButton(
            icon: Icons.add,
            enabled: _canIncrement,
            onPressed: () => onChanged(value + 1),
          ),
        ],
      ),
    );
  }
}

class _StepperButton extends StatelessWidget {
  const _StepperButton({
    required this.icon,
    required this.enabled,
    required this.onPressed,
  });

  final IconData icon;
  final bool enabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: enabled ? onPressed : null,
      icon: Icon(icon, size: AppSpacing.md),
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(minWidth: 44, minHeight: 40),
    );
  }
}
