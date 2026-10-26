import 'package:elara_flutter/core/models/product.dart';
import 'package:elara_flutter/features/korean/business_logic/mock_skincare_products.dart';

class SkincareProductRepository {
  const SkincareProductRepository();

  Future<List<Product>> fetchSkincareProducts() async {
    // TODO: Replace with a real HTTP call, e.g. `/products?category=skincare`.
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return mockSkincareProducts;
  }
}
