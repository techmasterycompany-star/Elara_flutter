import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

import '../../business_logic/shop_manager.dart';
import '../../data/models/skincare_product.dart';
import '../widgets/product_grid.dart';

/// Body-only screen listing everything the user has favourited.
///
/// Follows the same contract as `ProductDetailsScreen`: no [Scaffold] of its
/// own, it is hosted inside the layout that already owns one.
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key, required this.onProductTap});

  final ValueChanged<SkincareProduct> onProductTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListenableBuilder(
      listenable: ShopManager.instance,
      builder: (context, _) {
        final products = ShopManager.instance.favoriteProducts;

        if (products.isEmpty) {
          return _EmptyFavorites(textTheme: textTheme);
        }

        return ProductGrid(products: products, onProductTap: onProductTap);
      },
    );
  }
}

class _EmptyFavorites extends StatelessWidget {
  const _EmptyFavorites({required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: AppSpacing.sm,
        children: [
          Icon(
            Icons.favorite_border_outlined,
            size: AppSpacing.xxl,
            color: Theme.of(context).disabledColor,
          ),
          Text('No favourites yet', style: textTheme.headlineSmall),
          Text(
            'Tap the heart on a product to save it here.',
            style: textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
