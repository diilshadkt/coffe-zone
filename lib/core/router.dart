import 'package:coffee_zone/features/auth/view/pages/landing_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: LandingPage.routePath,
  routes: [
    GoRoute(
      path: LandingPage.routePath,
      builder: (context, state) => const LandingPage(),
    )
  ],
);
