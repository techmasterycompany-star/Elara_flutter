import 'package:elara_flutter/core/models/product.dart';
import 'package:elara_flutter/core/widgets/product_grid.dart';
import 'package:flutter/material.dart';

/// Loading/empty wrapper around [ProductGrid] for simple catalogues.
class ProductCatalogueView extends StatefulWidget {
  const ProductCatalogueView({
    super.key,
    required this.loadProducts,
    required this.onProductTap,
  });

  final Future<List<Product>> Function() loadProducts;
  final ValueChanged<Product> onProductTap;

  @override
  State<ProductCatalogueView> createState() => _ProductCatalogueViewState();
}

class _ProductCatalogueViewState extends State<ProductCatalogueView> {
  late final Future<List<Product>> _productsFuture = widget.loadProducts();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
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

        final products = snapshot.data ?? const <Product>[];
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
