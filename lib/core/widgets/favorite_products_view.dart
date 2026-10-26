import 'package:elara_flutter/core/business_logic/shop_manager.dart';
import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:elara_flutter/core/models/product.dart';
import 'package:elara_flutter/core/widgets/product_grid.dart';
import 'package:flutter/material.dart';

/// Favourites grid shared by catalogue features.
class FavoriteProductsView extends StatelessWidget {
  const FavoriteProductsView({super.key, required this.onProductTap});

  final ValueChanged<Product> onProductTap;

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
