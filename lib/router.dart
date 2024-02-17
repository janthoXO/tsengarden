import 'package:go_router/go_router.dart';
import 'package:tsengarden/main.dart';

final GoRouter _router = GoRouter(
  initialLocation: "/",
    routes: [
      GoRoute(
          path: "/",
          builder: (ctx, state) => const MyApp()
      ),
    ],
);