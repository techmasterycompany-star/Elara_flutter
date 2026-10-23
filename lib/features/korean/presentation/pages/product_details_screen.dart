import 'package:elara_flutter/core/constants/app_colors.dart';
import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:elara_flutter/core/theme/app_Typography.dart';
import 'package:elara_flutter/core/widgets/pill_button.dart';
import 'package:flutter/material.dart';

import '../../business_logic/shop_manager.dart';
import '../../data/models/skincare_product.dart';
import '../widgets/product_image.dart';
import '../widgets/quantity_selector.dart';
import '../widgets/rating_stars.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final SkincareProduct product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = _initialQuantity(widget.product);
  }

  @override
  void didUpdateWidget(covariant ProductDetailsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.product.id != widget.product.id) {
      _quantity = _initialQuantity(widget.product);
    }
  }

  static int _initialQuantity(SkincareProduct product) =>
      product.isInStock ? 1 : 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final product = widget.product;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSpacing.lg,
              children: [
                _buildImage(context, product),
                _buildHeader(textTheme, product),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: textTheme.headlineLarge,
                    ),
                    _buildStockBadge(context, product),
                  ],
                ),
                _buildActionBar(context, product),
              ],
            ),
          ),
        ),
        const Divider(height: 1),
        _buildProductInfo(textTheme, product),
      ],
    );
  }

  Widget _buildHeader(TextTheme textTheme, SkincareProduct product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSpacing.xs,
      children: [
        Text(
          product.name,
          style: textTheme.headlineMedium?.copyWith(
            color: AppColors.darkTextSecondary,
          ),
        ),
        Row(
          spacing: AppSpacing.xs,
          children: [
            RatingStars(rating: product.rating),
            Text(
              '${product.rating.toStringAsFixed(1)} / 5',
              style: textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImage(BuildContext context, SkincareProduct product) {
    final colorTheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 260,
          padding: EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: colorTheme.surface,
            border: Border.all(color: Theme.of(context).dividerColor),
            borderRadius: BorderRadius.circular(AppRadius.lg),
          ),
          child: ProductImage(imageUrl: product.imageUrl, fit: BoxFit.contain),
        ),
        Positioned(
          bottom: AppSpacing.xs,
          right: AppSpacing.xs,
          child: _buildFavoriteButton(context, product),
        ),
      ],
    );
  }

  Widget _buildFavoriteButton(BuildContext context, SkincareProduct product) {
    final colorTheme = Theme.of(context).colorScheme;
    final shop = ShopManager.instance;

    return ListenableBuilder(
      listenable: shop,
      builder: (context, _) {
        final isFavorite = shop.isFavorite(product);
        return Material(
          color: colorTheme.surface,
          shape: const CircleBorder(),
          child: IconButton(
            onPressed: () => shop.toggleFavorite(product),
            visualDensity: VisualDensity.compact,
            tooltip: isFavorite
                ? 'Remove from favourites'
                : 'Add to favourites',
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
              size: AppSpacing.lg,
              color: isFavorite ? AppColors.primary : colorTheme.onSurface,
            ),
          ),
        );
      },
    );
  }

  Widget _buildStockBadge(BuildContext context, SkincareProduct product) {
    late final Color foreground;
    late final Color background;
    late final Color border;
    late final String label;

    if (!product.isInStock) {
      foreground = AppColors.errorForeground;
      background = AppColors.errorBackground;
      border = AppColors.errorBorder;
      label = 'Out of stock';
    } else if (product.isLowStock) {
      foreground = AppColors.warningForeground;
      background = AppColors.warningBackground;
      border = AppColors.warningBorder;
      label = 'Only ${product.stock} left';
    } else {
      foreground = AppColors.successForeground;
      background = AppColors.successBackground;
      border = AppColors.successBorder;
      label = 'In stock · ${product.stock} units';
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: background,
        border: Border.all(color: border),
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Text(
        label,
        style: AppTypography.labelMedium.copyWith(color: foreground),
      ),
    );
  }

  Widget _buildProductInfo(TextTheme textTheme, SkincareProduct product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSpacing.sm,
      children: [
        Text('Product Info', style: textTheme.headlineSmall),
        Text(
          product.productInfo,
          style: textTheme.bodyMedium?.copyWith(height: 1.7),
        ),
      ],
    );
  }

  Widget _buildActionBar(BuildContext context, SkincareProduct product) {
    // Sold out products cannot be added to the cart.
    final canAddToCart = product.isInStock;

    return SafeArea(
      top: false,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: AppSpacing.lg),
        padding: EdgeInsets.only(top: AppSpacing.md),
        child: Row(
          spacing: AppSpacing.md,
          children: [
            QuantitySelector(
              value: _quantity,
              min: product.isInStock ? 1 : 0,
              max: product.stock,
              onChanged: (value) => setState(() => _quantity = value),
            ),
            Expanded(
              child: Opacity(
                opacity: canAddToCart ? 1 : 0.5,
                child: PillButton(
                  message: 'Add to Cart',
                  isSelected: canAddToCart,
                  onPressed: canAddToCart ? _addToCart : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addToCart() {
    final product = widget.product;
    ShopManager.instance.addToCart(product, quantity: _quantity);

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text('$_quantity × ${product.name} added to cart')),
      );
  }
}
