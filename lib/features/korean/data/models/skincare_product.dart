/// A skincare product as it will come back from the API.
class SkincareProduct {
  const SkincareProduct({
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

  /// How many units are currently available in stock.
  final int stock;

  /// Empty until the API returns a real url, in which case it is loaded
  /// from the network and the placeholder asset is used as a fallback.
  final String imageUrl;

  final double rating;
  final bool isNew;
  final String productInfo;

  /// Stock at or below this value is shown as "low stock".
  static const int lowStockThreshold = 10;

  bool get isInStock => stock > 0;

  bool get isLowStock => isInStock && stock <= lowStockThreshold;

  factory SkincareProduct.fromJson(Map<String, dynamic> json) {
    return SkincareProduct(
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
