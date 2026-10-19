import 'package:elara_flutter/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

import '../../data/models/skincare_product.dart';
import '../../data/skincare_product_repository.dart';
import '../widgets/productcard.dart';

class SkincareScreen extends StatefulWidget {
  const SkincareScreen({super.key, required this.onProductTap});

  /// Called when a card is tapped so the layout can open its details.
  final ValueChanged<SkincareProduct> onProductTap;

  @override
  State<SkincareScreen> createState() => _SkincareScreenState();
}

class _SkincareScreenState extends State<SkincareScreen> {
  static const _repository = SkincareProductRepository();

  /// Started once; TODO: switch to a Cubit/Bloc when the API is wired up.
  late final Future<List<SkincareProduct>> _productsFuture =
      _repository.fetchSkincareProducts();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SkincareProduct>>(
      future: _productsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('Something went wrong. Pull to try again.'),
          );
        }

        final products = snapshot.data ?? const <SkincareProduct>[];
        if (products.isEmpty) {
          return const Center(child: Text('No products found.'));
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
                    onTap: () => widget.onProductTap(product),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
