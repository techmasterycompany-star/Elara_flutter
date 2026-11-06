import 'package:elara_flutter/features/makeup/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:elara_flutter/features/makeup/presentation/widgets/product_badge.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onAddToCart;
  final VoidCallback? onTap;

  final bool isFavorite;

  const ProductCard({
    super.key,
    required this.product,
    this.onFavoriteTap,
    this.onAddToCart,
    this.onTap,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFCFAFB),
          border: Border.all(color: const Color(0xFFE8DADD)),
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image and badges
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      product.images.isNotEmpty ? product.images.first : '',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.image_not_supported_outlined),
                        );
                      },
                    ),
                  ),

                  // Product badges
                  Positioned(
                    top: 10,
                    left: 10,
                    right: 45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (product.isNew)
                          const ProductBadge(type: ProductBadgeType.newProduct),

                        if (product.isNew && product.hasDiscount)
                          const SizedBox(height: 6),

                        if (product.hasDiscount)
                          ProductBadge(
                            type: ProductBadgeType.discount,
                            discountPercentage: product.discountPercentage,
                          ),
                      ],
                    ),
                  ),

                  // Favorite button
                  Positioned(
                    top: 4,
                    right: 4,
                    child: IconButton(
                      onPressed: onFavoriteTap,
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.black87,
                      ),
                    ),
                  ),

                  // Rating
                  // Positioned(
                  //   left: 10,
                  //   bottom: 10,
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //       horizontal: 7,
                  //       vertical: 4,
                  //     ),
                  //     decoration: BoxDecoration(
                  //       color: const Color(0xFFEDE6EA),
                  //       borderRadius: BorderRadius.circular(20),
                  //     ),
                  //     child: Row(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         const Icon(
                  //           Icons.star,
                  //           size: 14,
                  //           color: Color(0xFFFFC44D),
                  //         ),
                  //         const SizedBox(width: 3),
                  // Text(
                  //   product.rating.toStringAsFixed(1),
                  //   style: const TextStyle(
                  //     fontSize: 11,
                  //     color: Colors.black87,
                  //   ),
                  // ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),

            // Product information
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 10, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category.name,
                    style: const TextStyle(color: Colors.grey, fontSize: 11),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      Expanded(
                        child: Wrap(
                          spacing: 6,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              '\$${product.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            if (product.hasDiscount)
                              Text(
                                '\$${product.oldPrice!.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 4),

                      SizedBox(
                        width: 30,
                        height: 30,
                        child: Material(
                          color: const Color(0xFF191919),
                          shape: const CircleBorder(),
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: onAddToCart,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 23,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
