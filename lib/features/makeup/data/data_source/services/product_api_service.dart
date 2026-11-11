import 'package:elara_flutter/features/makeup/data/models/product_model.dart';
import 'package:elara_flutter/features/makeup/data/data_source/api_services.dart';

class ProductApiService {
  final ApiServices apiServices;
  ProductApiService({required this.apiServices});
  Future<List<ProductModel>> getProducts() async {
    final response = await apiServices.get(endpoint: 'products');
    final List products = response['data']['products'];
    return products.map((product) => ProductModel.fromJson(product)).toList();
  }
}
