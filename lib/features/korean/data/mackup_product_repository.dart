import 'package:elara_flutter/core/models/product.dart';
import 'package:elara_flutter/features/korean/business_logic/mock_mackup_products.dart';

class MackupProductRepository {
  const MackupProductRepository();

  Future<List<Product>> fetchMackupProducts() async {
    // TODO: Replace with a real HTTP call, e.g. `/products?category=makeup`.
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return mockMackupProducts;
  }
}
