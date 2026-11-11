import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:elara_flutter/core/widgets/pill_button.dart';
import 'package:flutter/material.dart';

/// Horizontal scrollable filter bar for product categories.
class CategoryFilterBar extends StatelessWidget {
  const CategoryFilterBar({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: AppSpacing.xs,
        children: [
          for (final category in categories)
            PillButton(
              message: category,
              isSelected: selectedCategory == category,
              onPressed: () => onCategorySelected(category),
            ),
        ],
      ),
    );
  }
}
