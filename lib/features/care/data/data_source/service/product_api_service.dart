import 'package:elara_flutter/features/care/data/data_source/api_services.dart';
import 'package:elara_flutter/features/care/data/models/product_model.dart';

class ProductApiService {
  final ApiServices apiServices;
  ProductApiService({required this.apiServices});
  Future<List<ProductModel>> getProducts() async {
    final response = await apiServices.get(endpoint: 'products');
    final List products = response['data']['products'];
    return products.map((product) => ProductModel.fromJson(product)).toList();
  }
}
