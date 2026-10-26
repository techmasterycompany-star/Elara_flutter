import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

/// Breadcrumb row with an optional back button.
class BreadcrumbPath extends StatelessWidget {
  const BreadcrumbPath({super.key, required this.path, this.onBack});

  final String path;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    if (onBack == null) {
      return Text(path, style: textTheme.bodyLarge);
    }

    return Row(
      children: [
        IconButton(
          onPressed: onBack,
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Back',
        ),
        SizedBox(width: AppSpacing.xxs),
        Expanded(
          child: Text(
            path,
            style: textTheme.bodyLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
