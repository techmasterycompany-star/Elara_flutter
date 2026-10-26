import 'package:elara_flutter/core/models/product.dart';

import 'bundle_segment.dart';

/// A [Product] paired with the bundle segment it belongs to.
class BundleProduct {
  const BundleProduct({required this.product, required this.segment});

  final Product product;
  final BundleSegment segment;
}
