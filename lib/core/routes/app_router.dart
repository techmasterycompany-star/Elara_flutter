import 'package:elara_flutter/features/care/presentation/pages/face_nivea/face_nivea_screen.dart';
import 'package:elara_flutter/features/care/presentation/pages/nivea_product_details/nivea_product_details_screen.dart';
import 'package:elara_flutter/features/makeup/data/models/product_model.dart';
import 'package:elara_flutter/features/care/data/models/product_model.dart '
    as care;
import 'package:elara_flutter/features/makeup/presentation/pages/mackup%20brand/mackup_brand_screen.dart';
import 'package:elara_flutter/features/makeup/presentation/pages/mascea_product_details/mascea_product_details_screen.dart';
import 'package:elara_flutter/features/makeup/presentation/pages/top_face/top_face_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter appRouter = GoRouter(
  initialLocation: '/MackupBrandScreen',
  routes: [
    GoRoute(
      path: '/MackupBrandScreen',
      builder: (context, state) => const MackupBrandScreen(),
    ),

    GoRoute(
      path: '/TopFaceScreen',
      builder: (context, state) => const TopFaceScreen(),
    ),

    GoRoute(
      path: '/MasceaProductDetailsScreen',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;

        return MasceaProductDetailsScreen(
          product: data['product'] as ProductModel,
          allProducts: data['allProducts'] as List<ProductModel>,
        );
      },
    ),
    GoRoute(
      path: '/FaceNiveaScreen',
      builder: (context, state) => const FaceNiveaScreen(),
    ),
    GoRoute(
      path: '/NiveaProductDetailsScreen',
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;

        return NiveaProductDetailsScreen(
          product: data['product'] as care.ProductModel,
          allProducts: data['allProducts'] as List<care.ProductModel>,
        );
      },
    ),
  ],
);
