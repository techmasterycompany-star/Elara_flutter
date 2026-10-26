import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:elara_flutter/core/models/product.dart';
import 'package:elara_flutter/core/widgets/category_filter_bar.dart';
import 'package:elara_flutter/core/widgets/product_grid.dart';
import 'package:flutter/material.dart';

import '../../data/skincare_product_repository.dart';

enum SkincareCategory {
  all('All Product'),
  cleansers('Cleansers'),
  toners('Toners'),
  moisturizers('Moisturizers'),
  sunscreen('Sunscreen'),
  mask('Mask');

  const SkincareCategory(this.label);
  final String label;
}

class SkincareScreen extends StatefulWidget {
  const SkincareScreen({super.key, required this.onProductTap});

  final ValueChanged<Product> onProductTap;

  @override
  State<SkincareScreen> createState() => _SkincareScreenState();
}

class _SkincareScreenState extends State<SkincareScreen> {
  static const _repository = SkincareProductRepository();

  late final Future<List<Product>> _productsFuture = _repository
      .fetchSkincareProducts();

  SkincareCategory _selectedCategory = SkincareCategory.all;

  List<String> get _categories =>
      SkincareCategory.values.map((e) => e.label).toList();

  List<Product> _filterProducts(List<Product> products) {
    if (_selectedCategory == SkincareCategory.all) {
      return products;
    }

    final target = _selectedCategory.label.toLowerCase();
    return products.where((product) {
      final category = product.category.toLowerCase();
      if (_selectedCategory == SkincareCategory.cleansers) {
        return category == 'cleansers' || category == 'cleanser';
      }
      if (_selectedCategory == SkincareCategory.toners) {
        return category == 'toners' ||
            category == 'toner' ||
            category == 'essence';
      }
      if (_selectedCategory == SkincareCategory.moisturizers) {
        return category == 'moisturizers' ||
            category == 'moisturizer' ||
            category == 'cream' ||
            category == 'serum';
      }
      if (_selectedCategory == SkincareCategory.sunscreen) {
        return category == 'sunscreen';
      }
      if (_selectedCategory == SkincareCategory.mask) {
        return category == 'mask';
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
                  _selectedCategory = SkincareCategory.values.firstWhere(
                    (e) => e.label == label,
                    orElse: () => SkincareCategory.all,
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
