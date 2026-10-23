import 'package:go_router/go_router.dart';

import '../../features/korean/presentation/pages/korean_layout.dart';
import 'app_routes.dart';

GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.koreanLayout,
  routes: [
    // ======================================
    // ========= KOREAN PAGES ===============
    GoRoute(
      path: AppRoutes.koreanLayout,
      name: 'koreanLayout',
      builder: (context, state) => const KoreanLayout(),
    ),
    // ======================================
  ],
);