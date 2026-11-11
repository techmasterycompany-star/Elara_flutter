import 'package:elara_flutter/core/constants/app_colors.dart';
import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:elara_flutter/core/widgets/pill_button.dart';
import 'package:flutter/material.dart';

import '../../business_logic/shop_manager.dart';
import '../../data/models/skincare_product.dart';
import 'mackup_screen.dart';
import 'favorite_screen.dart';
import 'product_details_screen.dart';
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

  SkincareProduct? _selectedProduct;

  String get _currentTab => index == 0 ? 'Skincare' : 'Mackup';

  void _selectTab(int value) => setState(() => index = value);

  void _openProduct(SkincareProduct product) {
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
    final textTheme = Theme.of(context).textTheme;
    final isCatalogue = _view == _KoreanView.catalogue;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu, size: 30)),
        title: Image.asset('assets/images/logo.png', height: 100),
        centerTitle: true,
        actions: [
          _buildFavoritesAction(context),
          _buildCartAction(context),
        ],
      ),

      body: Container(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: Column(
          spacing: AppSpacing.xl,
          crossAxisAlignment: .start,
          children: [
            _buildPath(textTheme, _breadcrumb, isCatalogue ? null : _goBack),

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
        return FavoriteScreen(onProductTap: _openProduct);
      case _KoreanView.productDetails:
        return ProductDetailsScreen(product: _selectedProduct!);
    }
  }

  Widget _buildFavoritesAction(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return ListenableBuilder(
      listenable: ShopManager.instance,
      builder: (context, _) {
        final hasFavorites = ShopManager.instance.favoriteCount > 0;
        return IconButton(
          onPressed: _showFavorites,
          tooltip: 'Favourites',
          icon: Icon(
            hasFavorites ? Icons.favorite : Icons.favorite_border_outlined,
            size: 30,
            color: hasFavorites ? AppColors.primary : colorTheme.onSurface,
          ),
        );
      },
    );
  }

  Widget _buildCartAction(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return ListenableBuilder(
      listenable: ShopManager.instance,
      builder: (context, _) {
        final count = ShopManager.instance.cartItemCount;
        return IconButton(
          onPressed: _showCartSummary,
          tooltip: 'Cart',
          icon: Badge(
            isLabelVisible: count > 0,
            label: Text('$count'),
            child: Icon(
              Icons.shopping_bag_outlined,
              size: 30,
              color: colorTheme.onSurface,
            ),
          ),
        );
      },
    );
  }

  void _showCartSummary() {
    final shop = ShopManager.instance;
    final message = shop.cartItemCount == 0
        ? 'Your cart is empty'
        : '${shop.cartItemCount} item(s) · \$${shop.cartTotal.toStringAsFixed(2)}';

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}

Widget _buildPath(TextTheme textTheme, String path, VoidCallback? onBack) {
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
