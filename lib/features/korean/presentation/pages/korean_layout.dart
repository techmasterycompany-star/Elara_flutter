import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:elara_flutter/core/models/product.dart';
import 'package:elara_flutter/core/widgets/breadcrumb_path.dart';
import 'package:elara_flutter/core/widgets/favorite_products_view.dart';
import 'package:elara_flutter/core/widgets/pill_button.dart';
import 'package:elara_flutter/core/widgets/product_details_view.dart';
import 'package:elara_flutter/core/widgets/shop_app_bar.dart';
import 'package:elara_flutter/core/widgets/shop_drawer.dart';
import 'package:flutter/material.dart';

import 'mackup_screen.dart';
import 'skincare_screen.dart';

/// Which body the layout is currently showing.
enum _KoreanView { catalogue, productDetails, favorites }

class KoreanLayout extends StatefulWidget {
  const KoreanLayout({super.key});

  @override
  State<KoreanLayout> createState() => _KoreanLayoutState();
}

class _KoreanLayoutState extends State<KoreanLayout> {
  int index = 0;

  _KoreanView _view = _KoreanView.catalogue;

  /// Where the back button returns to when leaving the details screen.
  _KoreanView _returnView = _KoreanView.catalogue;

  Product? _selectedProduct;

  String get _currentTab => index == 0 ? 'Skincare' : 'Mackup';

  void _selectTab(int value) => setState(() => index = value);

  void _openProduct(Product product) {
    setState(() {
      if (_view != _KoreanView.productDetails) _returnView = _view;
      _selectedProduct = product;
      _view = _KoreanView.productDetails;
    });
  }

  void _showFavorites() => setState(() => _view = _KoreanView.favorites);

  void _goBack() {
    setState(() {
      if (_view == _KoreanView.productDetails) {
        _selectedProduct = null;
        _view = _returnView;
      } else {
        _view = _KoreanView.catalogue;
      }
    });
  }

  String get _breadcrumb {
    switch (_view) {
      case _KoreanView.catalogue:
        return 'Home / Product / Korean Product / $_currentTab';
      case _KoreanView.favorites:
        return 'Home / Product / Korean Product / Favourites';
      case _KoreanView.productDetails:
        return 'Home / Product / Korean Product / $_currentTab / ${_selectedProduct!.name}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isCatalogue = _view == _KoreanView.catalogue;

    return Scaffold(
      appBar: ShopAppBar(onFavorites: _showFavorites),
      drawer: const ShopDrawer(),
      body: Container(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          spacing: AppSpacing.xl,
          crossAxisAlignment: .start,
          children: [
            BreadcrumbPath(
              path: _breadcrumb,
              onBack: isCatalogue ? null : _goBack,
            ),

            if (isCatalogue)
              Row(
                spacing: AppSpacing.xs,
                children: [
                  PillButton(
                    message: 'Skincare',
                    isSelected: index == 0,
                    onPressed: () => _selectTab(0),
                  ),
                  PillButton(
                    message: 'Mackup',
                    isSelected: index == 1,
                    onPressed: () => _selectTab(1),
                  ),
                ],
              ),

            Expanded(child: _buildBody()),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_view) {
      case _KoreanView.catalogue:
        return IndexedStack(
          index: index,
          children: [
            SkincareScreen(onProductTap: _openProduct),
            MackupScreen(onProductTap: _openProduct),
          ],
        );
      case _KoreanView.favorites:
        return FavoriteProductsView(onProductTap: _openProduct);
      case _KoreanView.productDetails:
        return ProductDetailsView(product: _selectedProduct!);
    }
  }
}
