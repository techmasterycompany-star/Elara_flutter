import 'package:elara_flutter/features/care/data/data_source/service/product_api_service.dart';
import 'package:elara_flutter/features/care/data/models/product_model.dart';

class ProductRepository {
  final ProductApiService productApiService;
  ProductRepository({required this.productApiService});
  Future<List<ProductModel>> getProducts() async {
    return await productApiService.getProducts();
  }
}
