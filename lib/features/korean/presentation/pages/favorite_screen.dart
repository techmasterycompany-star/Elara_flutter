import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

import '../../business_logic/shop_manager.dart';
import '../../data/models/skincare_product.dart';
import '../widgets/productcard.dart';

/// Body-only screen listing everything the user has favourited.
///
/// Follows the same contract as `ProductDetailsScreen`: no [Scaffold] of its
/// own, it is hosted inside the layout that already owns one.
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key, required this.onProductTap});

  /// Opens the details of a favourited product.
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
                  Productcard(
                    product: product,
                    onTap: () => onProductTap(product),
                  ),
              ],
            ),
          ),
        );
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
