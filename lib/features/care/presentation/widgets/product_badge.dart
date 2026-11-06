import 'package:flutter/material.dart';

enum ProductBadgeType { newProduct, bestSeller, discount }

class ProductBadge extends StatelessWidget {
  final ProductBadgeType type;
  final int? discountPercentage;
  const ProductBadge({super.key, required this.type, this.discountPercentage});

  @override
  Widget build(BuildContext context) {
    late final String text;
    late final Color color;
    switch (type) {
      case ProductBadgeType.newProduct:
        text = 'new';
        color = Color(0xFFE56B7F);
      case ProductBadgeType.bestSeller:
        text = 'Best seller';
        color = Color(0xFFF4C566);
      case ProductBadgeType.discount:
        text = 'Save $discountPercentage%';
        color = Color(0xFFC5221F);
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
