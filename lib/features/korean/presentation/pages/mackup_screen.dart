import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:elara_flutter/core/models/product.dart';
import 'package:elara_flutter/core/widgets/category_filter_bar.dart';
import 'package:elara_flutter/core/widgets/product_grid.dart';
import 'package:flutter/material.dart';

import '../../data/mackup_product_repository.dart';

enum MackupCategory {
  all('All Product'),
  face('Face'),
  eyes('Eyes'),
  nails('Nails'),
  lips('Lips');

  const MackupCategory(this.label);
  final String label;
}

class MackupScreen extends StatefulWidget {
  const MackupScreen({super.key, required this.onProductTap});

  final ValueChanged<Product> onProductTap;

  @override
  State<MackupScreen> createState() => _MackupScreenState();
}

class _MackupScreenState extends State<MackupScreen> {
  static const _repository = MackupProductRepository();

  late final Future<List<Product>> _productsFuture = _repository
      .fetchMackupProducts();

  MackupCategory _selectedCategory = MackupCategory.all;

  List<String> get _categories =>
      MackupCategory.values.map((e) => e.label).toList();

  List<Product> _filterProducts(List<Product> products) {
    if (_selectedCategory == MackupCategory.all) {
      return products;
    }

    final target = _selectedCategory.label.toLowerCase();
    return products.where((product) {
      final category = product.category.toLowerCase();
      if (_selectedCategory == MackupCategory.nails) {
        return category == 'nails' || category == 'nail';
      }
      return category == target;
    }).toList();
  }

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

        final allProducts = snapshot.data ?? const <Product>[];
        final products = _filterProducts(allProducts);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.md,
          children: [
            CategoryFilterBar(
              categories: _categories,
              selectedCategory: _selectedCategory.label,
              onCategorySelected: (label) {
                setState(() {
                  _selectedCategory = MackupCategory.values.firstWhere(
                    (e) => e.label == label,
                    orElse: () => MackupCategory.all,
                  );
                });
              },
            ),
            Expanded(
              child: products.isEmpty
                  ? const Center(child: Text('No products found.'))
                  : ProductGrid(
                      products: products,
                      onProductTap: widget.onProductTap,
                    ),
            ),
          ],
        );
      },
    );
  }
}
