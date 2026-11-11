import 'package:dio/dio.dart';
import 'package:elara_flutter/core/network/dio_client.dart';
import 'package:elara_flutter/features/care/data/data_source/service/product_api_service.dart'
    as care_service;
import 'package:get_it/get_it.dart';

// Makeup
import 'package:elara_flutter/features/makeup/busines_logic/cubit/products_cubit.dart'
    as makeup_cubit;
import 'package:elara_flutter/features/makeup/data/data_source/api_services.dart'
    as makeup_api;
import 'package:elara_flutter/features/makeup/data/data_source/services/product_api_service.dart'
    as makeup_service;
import 'package:elara_flutter/features/makeup/data/repositories/product_repository.dart'
    as makeup_repo;

// Care
import 'package:elara_flutter/features/care/busines_logic/cubit/products_cubit.dart'
    as care_cubit;
import 'package:elara_flutter/features/care/data/data_source/api_services.dart'
    as care_api;
import 'package:elara_flutter/features/care/data/repositories/product_repository.dart'
    as care_repo;

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Dio (shared)
  getIt.registerLazySingleton<Dio>(() => DioClient.create());

  // Makeup
  getIt.registerLazySingleton<makeup_api.ApiServices>(
    () => makeup_api.ApiServices(dio: getIt<Dio>()),
  );

  getIt.registerLazySingleton<makeup_service.ProductApiService>(
    () => makeup_service.ProductApiService(
      apiServices: getIt<makeup_api.ApiServices>(),
    ),
  );

  getIt.registerLazySingleton<makeup_repo.ProductRepository>(
    () => makeup_repo.ProductRepository(
      productApiService: getIt<makeup_service.ProductApiService>(),
    ),
  );

  getIt.registerFactory<makeup_cubit.ProductsCubit>(
    () => makeup_cubit.ProductsCubit(
      productsRepository: getIt<makeup_repo.ProductRepository>(),
    ),
  );

  // Care
  getIt.registerLazySingleton<care_api.ApiServices>(
    () => care_api.ApiServices(dio: getIt<Dio>()),
  );

  getIt.registerLazySingleton<care_service.ProductApiService>(
    () => care_service.ProductApiService(
      apiServices: getIt<care_api.ApiServices>(),
    ),
  );

  getIt.registerLazySingleton<care_repo.ProductRepository>(
    () => care_repo.ProductRepository(
      productApiService: getIt<care_service.ProductApiService>(),
    ),
  );

  getIt.registerFactory<care_cubit.ProductsCubit>(
    () => care_cubit.ProductsCubit(
      productsRepository: getIt<care_repo.ProductRepository>(),
    ),
  );
}

// import 'package:dio/dio.dart';
// import 'package:elara_flutter/core/network/dio_client.dart';
// import 'package:elara_flutter/features/makeup/busines_logic/cubit/products_cubit.dart';
// import 'package:elara_flutter/features/makeup/data/data_source/api_services.dart';
// import 'package:elara_flutter/features/makeup/data/data_source/services/product_api_service.dart';
// import 'package:elara_flutter/features/makeup/data/repositories/product_repository.dart';
// import 'package:get_it/get_it.dart';

// final getIt = GetIt.instance;

// void setupServiceLocator() {
//   getIt.registerLazySingleton<Dio>(() => DioClient.create());

//   getIt.registerLazySingleton<ApiServices>(
//     () => ApiServices(dio: getIt<Dio>()),
//   );

//   // ProductApiService
//   getIt.registerLazySingleton<ProductApiService>(
//     () => ProductApiService(apiServices: getIt<ApiServices>()),
//   );

//   // // ProductRepository
//   getIt.registerLazySingleton<ProductRepository>(
//     () => ProductRepository(productApiService: getIt<ProductApiService>()),
//   );

//   // ProductsCubit
//   getIt.registerFactory<ProductsCubit>(
//     () => ProductsCubit(productsRepository: getIt<ProductRepository>()),
//   );
// }
