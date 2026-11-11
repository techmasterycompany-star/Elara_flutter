import 'package:flutter/material.dart';

import '../../data/models/skincare_product.dart';
import 'product_grid.dart';

class ProductCatalogueView extends StatefulWidget {
  const ProductCatalogueView({
    super.key,
    required this.loadProducts,
    required this.onProductTap,
  });

  final Future<List<SkincareProduct>> Function() loadProducts;
  final ValueChanged<SkincareProduct> onProductTap;

  @override
  State<ProductCatalogueView> createState() => _ProductCatalogueViewState();
}

class _ProductCatalogueViewState extends State<ProductCatalogueView> {
  late final Future<List<SkincareProduct>> _productsFuture = widget
      .loadProducts();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SkincareProduct>>(
      future: _productsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong. Pull to try again.'),
          );
        }

        final products = snapshot.data ?? const <SkincareProduct>[];
        if (products.isEmpty) {
          return const Center(child: Text('No products found.'));
        }

        return ProductGrid(
          products: products,
          onProductTap: widget.onProductTap,
        );
      },
    );
  }
}
