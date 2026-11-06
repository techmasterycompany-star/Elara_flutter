import 'package:elara_flutter/features/makeup/data/models/product_model.dart';
import 'package:elara_flutter/features/makeup/data/data_source/services/product_api_service.dart';

class ProductRepository {
  final ProductApiService productApiService;
  ProductRepository({required this.productApiService});
  Future<List<ProductModel>> getProducts() async {
    return await productApiService.getProducts();
  }
}
