import 'package:go_router/go_router.dart';

import '../../features/bundle/presentation/screens/bundle_screen.dart';
import '../../features/korean/presentation/pages/korean_layout.dart';
import 'app_routes.dart';

GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.bundle,
  routes: [
    // ======================================
    // ========= KOREAN PAGES ===============
    GoRoute(
      path: AppRoutes.koreanLayout,
      name: 'koreanLayout',
      builder: (context, state) => const KoreanLayout(),
    ),
    // ======================================
    // ============ BUNDLE ==================
    GoRoute(
      path: AppRoutes.bundle,
      name: 'bundle',
      builder: (context, state) => const BundleScreen(),
    ),
    // ======================================
  ],
);
