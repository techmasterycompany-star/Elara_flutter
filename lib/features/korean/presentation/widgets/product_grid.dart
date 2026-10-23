import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

import '../../data/models/skincare_product.dart';
import 'productcard.dart';


class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
    required this.products,
    required this.onProductTap,
  });

  final List<SkincareProduct> products;
  final ValueChanged<SkincareProduct> onProductTap;

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
              Productcard(product: product, onTap: () => onProductTap(product)),
          ],
        ),
      ),
    );
  }
}
