import 'package:go_router/go_router.dart';

import 'package:elara_flutter/features/korean/presentation/pages/korean_layout.dart';
import 'package:elara_flutter/features/makeup/data/models/product_model.dart';
import 'package:elara_flutter/features/makeup/presentation/pages/mackup%20brand/mackup_brand_screen.dart';
import 'package:elara_flutter/features/makeup/presentation/pages/mascea_product_details/mascea_product_details_screen.dart';
import 'package:elara_flutter/features/makeup/presentation/pages/top_face/top_face_screen.dart';
import 'package:elara_flutter/features/care/data/models/product_model.dart' as care;
import 'package:elara_flutter/features/care/presentation/pages/face_nivea/face_nivea_screen.dart';
import 'package:elara_flutter/features/care/presentation/pages/nivea_product_details/nivea_product_details_screen.dart';
import 'package:elara_flutter/features/auth/presentation/login/login_screen.dart';
import 'package:elara_flutter/features/auth/presentation/signup/signup_screen.dart';
import 'package:elara_flutter/features/auth/presentation/partner_signup/partner_signup_screen.dart';
import 'package:elara_flutter/features/auth/presentation/verify_email/verify_email_screen.dart';
import 'package:elara_flutter/features/auth/presentation/create_new_password/create_new_password_screen.dart';
import 'package:elara_flutter/features/auth/presentation/password_success/password_success_screen.dart';

import 'app_routes.dart';

GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.login,
  routes: [
    GoRoute(
      path: AppRoutes.login,
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.signup,
      name: 'signup',
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: AppRoutes.partnerSignup,
      name: 'partnerSignup',
      builder: (context, state) => const PartnerSignupScreen(),
    ),
    GoRoute(
      path: AppRoutes.verifyEmail,
      name: 'verifyEmail',
      builder: (context, state) {
        String email = 'mariamhamd...23@gmail.com';
        final extra = state.extra;
        if (extra is String && extra.isNotEmpty) {
          email = extra;
        } else if (extra is Map<String, dynamic> && extra['email'] is String) {
          email = extra['email'] as String;
        }
        return VerifyEmailScreen(email: email);
      },
    ),
    GoRoute(
      path: AppRoutes.createNewPassword,
      name: 'createNewPassword',
      builder: (context, state) => const CreateNewPasswordScreen(),
    ),
    GoRoute(
      path: AppRoutes.passwordSuccess,
      name: 'passwordSuccess',
      builder: (context, state) => const PasswordSuccessScreen(),
    ),
    GoRoute(
      path: AppRoutes.koreanLayout,
      name: 'koreanLayout',
      builder: (context, state) => const KoreanLayout(),
    ),
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
