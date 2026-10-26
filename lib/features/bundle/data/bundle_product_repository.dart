import 'package:elara_flutter/features/bundle/business_logic/mock_bundle_products.dart';
import 'package:elara_flutter/features/bundle/data/models/bundle_product.dart';

class BundleProductRepository {
  const BundleProductRepository();

  Future<List<BundleProduct>> fetchBundleProducts() async {
    // TODO: Replace with a real HTTP call, e.g. `/products?segment=bundle`.
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return mockBundleProducts;
  }
}
