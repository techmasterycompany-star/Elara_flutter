import 'package:go_router/go_router.dart';

import '../../features/korean/presentation/pages/korean_layout.dart';

GoRouter appRouter  = GoRouter(
    initialLocation: '/koreanLayout',
    routes: [
      // ======================================
      // ========= KOREAN PAGES ===============
      GoRoute(path: '/koreanLayout',
      builder: (context, state) => const KoreanLayout(),
      ),
      // ======================================
    ]);