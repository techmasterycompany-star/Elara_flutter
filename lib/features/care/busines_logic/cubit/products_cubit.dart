import 'package:elara_flutter/features/care/busines_logic/cubit/products_state.dart';
import 'package:elara_flutter/features/care/data/repositories/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepository productsRepository;
  ProductsCubit({required this.productsRepository}) : super(ProductsInitial());
  Future<void> getProducts() async {
    try {
      emit(ProductsLoading());

      final products = await productsRepository.getProducts();

      emit(ProductsSuccess(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }
}
