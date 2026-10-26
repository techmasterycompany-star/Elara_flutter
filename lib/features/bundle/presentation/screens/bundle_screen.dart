import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:elara_flutter/core/models/product.dart';
import 'package:elara_flutter/core/widgets/breadcrumb_path.dart';
import 'package:elara_flutter/core/widgets/category_filter_bar.dart';
import 'package:elara_flutter/core/widgets/favorite_products_view.dart';
import 'package:elara_flutter/core/widgets/product_details_view.dart';
import 'package:elara_flutter/core/widgets/product_grid.dart';
import 'package:elara_flutter/core/widgets/shop_app_bar.dart';
import 'package:elara_flutter/core/widgets/shop_drawer.dart';
import 'package:flutter/material.dart';

import '../../data/bundle_product_repository.dart';
import '../../data/models/bundle_product.dart';
import '../../data/models/bundle_segment.dart';

/// Single-screen Bundle catalogue.
///
/// The product list, segment filters, favourites and product details all live
/// in this one screen, matching the Korean catalogue's UI.
class BundleScreen extends StatefulWidget {
  const BundleScreen({super.key});

  @override
  State<BundleScreen> createState() => _BundleScreenState();
}

class _BundleScreenState extends State<BundleScreen> {
  static const _repository = BundleProductRepository();

  late final Future<List<BundleProduct>> _productsFuture = _repository
      .fetchBundleProducts();

  BundleSegment _selectedSegment = BundleSegment.all;

  Product? _selectedProduct;

  bool _showFavorites = false;

  bool get _isCatalogue => _selectedProduct == null && !_showFavorites;

  void _selectSegment(String label) {
    setState(() {
      _selectedSegment = BundleSegment.values.firstWhere(
        (segment) => segment.label == label,
        orElse: () => BundleSegment.all,
      );
    });
  }

  void _openProduct(Product product) {
    setState(() => _selectedProduct = product);
  }

  void _showFavoritesView() {
    setState(() {
      _selectedProduct = null;
      _showFavorites = true;
    });
  }

  void _goBack() {
    setState(() {
      if (_selectedProduct != null) {
        _selectedProduct = null;
      } else {
        _showFavorites = false;
      }
    });
  }

  String get _breadcrumb {
    if (_selectedProduct != null) {
      final section = _showFavorites ? 'Favourites' : _selectedSegment.label;
      return 'Home / Bundle / $section / ${_selectedProduct!.name}';
    }
    if (_showFavorites) return 'Home / Bundle / Favourites';
    return 'Home / Bundle / ${_selectedSegment.label}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShopAppBar(onFavorites: _showFavoritesView),
      drawer: const ShopDrawer(),
      body: Container(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          spacing: AppSpacing.xl,
          crossAxisAlignment: .start,
          children: [
            BreadcrumbPath(
              path: _breadcrumb,
              onBack: _isCatalogue ? null : _goBack,
            ),

            if (_isCatalogue)
              CategoryFilterBar(
                categories: BundleSegment.values
                    .map((segment) => segment.label)
                    .toList(),
                selectedCategory: _selectedSegment.label,
                onCategorySelected: _selectSegment,
              ),

            Expanded(child: _buildBody()),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (_selectedProduct != null) {
      return ProductDetailsView(product: _selectedProduct!);
    }

    if (_showFavorites) {
      return FavoriteProductsView(onProductTap: _openProduct);
    }

    return _buildCatalogue();
  }

  Widget _buildCatalogue() {
    return FutureBuilder<List<BundleProduct>>(
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

        final allProducts = snapshot.data ?? const <BundleProduct>[];
        final products = <Product>[
          for (final item in allProducts)
            if (_selectedSegment == BundleSegment.all ||
                item.segment == _selectedSegment)
              item.product,
        ];

        if (products.isEmpty) {
          return const Center(child: Text('No products found.'));
        }

        return ProductGrid(products: products, onProductTap: _openProduct);
      },
    );
  }
}
