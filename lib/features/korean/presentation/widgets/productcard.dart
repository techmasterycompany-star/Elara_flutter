import 'package:elara_flutter/core/constants/app_colors.dart';
import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

import '../../business_logic/shop_manager.dart';
import '../../data/models/skincare_product.dart';
import 'product_image.dart';

class Productcard extends StatelessWidget {
  const Productcard({
    super.key,
    required this.product,
    this.onTap,
    this.onAddToCart,
  });

  final SkincareProduct product;
  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colorTheme.surface,
        boxShadow: const [BoxShadow(blurRadius: 0.5)],
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          child: Column(
            spacing: AppSpacing.sm,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ProductImage(imageUrl: product.imageUrl, fit: BoxFit.contain),

                    Positioned(
                      top: AppSpacing.xs,
                      right: AppSpacing.xs,
                      child: _FavoriteButton(product: product),
                    ),

                    if (product.isNew)
                      Positioned(
                        top: AppSpacing.xs,
                        left: AppSpacing.xs,
                        child: Text(
                          'New',
                          style: textTheme.bodyLarge
                              ?.copyWith(color: colorTheme.error),
                        ),
                      ),

                    Positioned(
                      bottom: AppSpacing.xs,
                      left: AppSpacing.xs,
                      child: Container(
                        padding: EdgeInsets.all(AppSpacing.xs),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppRadius.full),
                          color: colorTheme.surfaceContainer,
                        ),
                        child: Row(
                          spacing: AppRadius.sm,
                          children: [
                            const Icon(Icons.star),
                            Text(product.rating.toStringAsFixed(1)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSpacing.xs,
                  right: AppSpacing.xs,
                  bottom: AppSpacing.xs,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppSpacing.xs,
                  children: [
                    Text(
                      product.category,
                      style: textTheme.labelSmall?.copyWith(
                        color: AppColors.lightDisabledContent,
                      ),
                    ),
                    Text(product.name, style: textTheme.bodyLarge),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: textTheme.bodyMedium,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppRadius.full),
                            color: colorTheme.onSurface,
                          ),
                          child: IconButton(
                            onPressed: _addToCart(context),
                            icon: const Icon(Icons.add),
                            color: colorTheme.surface,
                            iconSize: AppSpacing.lg,
                            tooltip: 'Add to cart',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  VoidCallback _addToCart(BuildContext context) {
    return () {
      final added = ShopManager.instance.addToCart(product);
      if (!added) return;

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text('${product.name} added to cart')),
        );
      onAddToCart?.call();
    };
  }
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({required this.product});

  final SkincareProduct product;

  @override
  Widget build(BuildContext context) {
    final shop = ShopManager.instance;

    return ListenableBuilder(
      listenable: shop,
      builder: (context, _) {
        final isFavorite = shop.isFavorite(product);
        return IconButton(
          onPressed: () => shop.toggleFavorite(product),
          tooltip: isFavorite ? 'Remove from favourites' : 'Add to favourites',
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
            color: isFavorite ? AppColors.primary : null,
          ),
          iconSize: AppSpacing.xl,
        );
      },
    );
  }
}
