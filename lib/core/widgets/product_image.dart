import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final BoxFit fit;

  static const String placeholderAsset = 'assets/images/logo.png';

  bool get _isNetworkImage =>
      imageUrl.startsWith('http://') || imageUrl.startsWith('https://');

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty || !_isNetworkImage) {
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
