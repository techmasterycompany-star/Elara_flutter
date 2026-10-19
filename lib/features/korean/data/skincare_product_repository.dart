import 'package:elara_flutter/features/korean/business_logic/mock_skincare_products.dart';

import 'models/skincare_product.dart';

/// Serves the skincare catalogue.
///
/// Today it returns the mock list from `business_logic`. When the API is ready
/// only [fetchSkincareProducts] has to change.
class SkincareProductRepository {
  const SkincareProductRepository();

  Future<List<SkincareProduct>> fetchSkincareProducts() async {
    // TODO: Replace with a real HTTP call, e.g. `/products?category=skincare`.
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return mockSkincareProducts;
  }
}
