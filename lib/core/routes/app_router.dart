import 'package:go_router/go_router.dart';

GoRouter appRouter  = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/test',
        // builder: (context, state) => const test(),
      ),
    ]);