import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:elara_flutter/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Navigation drawer that lets the user hop between catalogue features.
class ShopDrawer extends StatelessWidget {
  const ShopDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(AppSpacing.lg),
              child: Text('Shop', style: textTheme.headlineSmall),
            ),
            _DrawerTile(
              icon: Icons.spa_outlined,
              label: 'Korean',
              route: AppRoutes.koreanLayout,
            ),
            _DrawerTile(
              icon: Icons.inventory_2_outlined,
              label: 'Bundles',
              route: AppRoutes.bundle,
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerTile extends StatelessWidget {
  const _DrawerTile({
    required this.icon,
    required this.label,
    required this.route,
  });

  final IconData icon;
  final String label;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: () {
        Navigator.of(context).pop();
        context.go(route);
      },
    );
  }
}
