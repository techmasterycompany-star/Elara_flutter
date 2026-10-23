import 'package:flutter/material.dart';

/// Shows the product image, falling back to the local placeholder asset while
/// the API does not return a real url yet.
class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.imageUrl, this.fit = BoxFit.cover});

  final String imageUrl;
  final BoxFit fit;

  static const String placeholderAsset = 'assets/images/logo.png';

  bool get _isNetworkImage => imageUrl.startsWith('http');

  @override
  Widget build(BuildContext context) {
    if (!_isNetworkImage) {
      return Image.asset(placeholderAsset, fit: BoxFit.contain);
    }

    return Image.network(
      imageUrl,
      fit: fit,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const Center(child: CircularProgressIndicator.adaptive());
      },
      errorBuilder: (context, error, stackTrace) =>
          Image.asset(placeholderAsset, fit: BoxFit.contain),
    );
  }
}
