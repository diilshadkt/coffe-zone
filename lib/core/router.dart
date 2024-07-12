import 'package:coffee_zone/features/auth/view/pages/landing_page.dart';
import 'package:coffee_zone/features/auth/view/pages/login_page.dart';
import 'package:coffee_zone/features/auth/view/pages/signup_page.dart';
import 'package:coffee_zone/features/nav/pages/navigation_page.dart';
import 'package:coffee_zone/main.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  navigatorKey: App.navigatorKey,
  initialLocation: LandingPage.routePath,
  routes: [
    GoRoute(
      path: LandingPage.routePath,
      builder: (context, state) => const LandingPage(),
    ),
    GoRoute(
      path: LoginPage.routePath,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: SignupPage.routePath,
      builder: (context, state) => const SignupPage(),
    ),
    GoRoute(
      path: NavigationPage.routePath,
      builder: (context, state) => const NavigationPage(),
    )
  ],
);
