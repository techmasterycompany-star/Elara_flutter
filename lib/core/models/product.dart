/// A shopping product as it comes back from the API.
///
/// Shared by every catalogue feature (Korean, Bundle, ...) so the same cards,
/// grids and detail views can be reused.
class Product {
  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.stock,
    this.imageUrl = '',
    this.rating = 0,
    this.isNew = false,
    this.productInfo = '',
  });

  final String id;
  final String name;
  final String category;
  final double price;
  final int stock;
  final String imageUrl;
  final double rating;
  final bool isNew;
  final String productInfo;
  static const int lowStockThreshold = 10;

  bool get isInStock => stock > 0;

  bool get isLowStock => isInStock && stock <= lowStockThreshold;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      name: json['name'] as String? ?? '',
      category: json['category'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      stock: (json['stock'] as num?)?.toInt() ?? 0,
      imageUrl: json['imageUrl'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      isNew: json['isNew'] as bool? ?? false,
      productInfo: json['productInfo'] as String? ?? '',
    );
  }
}
