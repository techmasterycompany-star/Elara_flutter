import 'package:elara_flutter/features/korean/business_logic/mock_mackup_products.dart';

import 'models/skincare_product.dart';

class MackupProductRepository {
  const MackupProductRepository();

  Future<List<SkincareProduct>> fetchMackupProducts() async {
    // TODO: Replace with a real HTTP call, e.g. `/products?category=makeup`.
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return mockMackupProducts;
  }
}
