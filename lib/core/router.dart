import 'package:coffee_zone/features/auth/view/pages/landing_page.dart';
import 'package:coffee_zone/features/auth/view/pages/login_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: LoginPage.routePath,
  routes: [
    GoRoute(
      path: LandingPage.routePath,
      builder: (context, state) => const LandingPage(),
    ),
    GoRoute(
      path: LoginPage.routePath,
      builder: (context, state) => const LoginPage(),
    )
  ],
);
