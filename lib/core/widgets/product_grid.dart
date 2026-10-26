import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:elara_flutter/core/models/product.dart';
import 'package:elara_flutter/core/widgets/product_card.dart';
import 'package:flutter/material.dart';

/// Two-column product grid shared by all catalogue screens.
class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
    required this.products,
    required this.onProductTap,
  });

  final List<Product> products;
  final ValueChanged<Product> onProductTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xs),
        child: GridView.count(
          crossAxisSpacing: AppRadius.md,
          mainAxisSpacing: AppSpacing.md,
          childAspectRatio: 0.6,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          children: [
            for (final product in products)
              ProductCard(product: product, onTap: () => onProductTap(product)),
          ],
        ),
      ),
    );
  }
}
