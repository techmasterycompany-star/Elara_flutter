import 'package:elara_flutter/core/business_logic/shop_manager.dart';
import 'package:elara_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

/// Shared app bar for catalogue features.
class ShopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShopAppBar({super.key, this.onFavorites});

  /// Called when the favourites action is tapped.
  final VoidCallback? onFavorites;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) => IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(Icons.menu, size: 30),
        ),
      ),
      title: Image.asset('assets/images/logo.png', height: 100),
      centerTitle: true,
      actions: [_buildFavoritesAction(context), _buildCartAction(context)],
    );
  }

  Widget _buildFavoritesAction(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return ListenableBuilder(
      listenable: ShopManager.instance,
      builder: (context, _) {
        final hasFavorites = ShopManager.instance.favoriteCount > 0;
        return IconButton(
          onPressed: onFavorites,
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
          onPressed: () => _showCartSummary(context),
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

  void _showCartSummary(BuildContext context) {
    final shop = ShopManager.instance;
    final message = shop.cartItemCount == 0
        ? 'Your cart is empty'
        : '${shop.cartItemCount} item(s) · \$${shop.cartTotal.toStringAsFixed(2)}';

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
