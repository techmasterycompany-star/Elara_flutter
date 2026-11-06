import 'package:elara_flutter/features/makeup/data/models/category_model.dart';
import 'package:elara_flutter/features/makeup/data/models/seller_model.dart';

class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final int stock;
  final bool isActive;
  final List<String> images;
  final bool isNew;
  final SellerModel seller;
  final CategoryModel category;
  final double? oldPrice;
  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.stock = 0,
    this.isActive = true,
    this.images = const [],
    this.isNew = false,
    required this.seller,
    required this.category,
    this.oldPrice,
  });

  bool get hasDiscount {
    return oldPrice != null && oldPrice! > price;
  }

  int get discountPercentage {
    if (!hasDiscount) return 0;

    return ((oldPrice! - price) / oldPrice! * 100).round();
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      stock: json['stock'] as int? ?? 0,
      isActive: json['isActive'] as bool? ?? true,
      images: List<String>.from(json['images'] ?? []),
      isNew: json['isNew'] as bool? ?? false,
      seller: SellerModel.fromJson(json['seller'] as Map<String, dynamic>),
      category: CategoryModel.fromJson(
        json['category'] as Map<String, dynamic>,
      ),
      oldPrice: json['oldPrice'] == null
          ? null
          : (json['oldPrice'] as num).toDouble(),
    );
  }
}
