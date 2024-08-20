import 'package:coffee_zone/features/auth/view/pages/landing_page.dart';
import 'package:coffee_zone/features/auth/view/pages/login_page.dart';
import 'package:coffee_zone/features/auth/view/pages/signup_page.dart';
import 'package:coffee_zone/features/nav/view/pages/navigation_page.dart';
import 'package:coffee_zone/features/order/view/pages/orders_list_page.dart';
import 'package:coffee_zone/features/product/view/pages/product_list_page.dart';
import 'package:coffee_zone/features/product/view/pages/products_add_page.dart';
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
    ),
    GoRoute(
      path: ProductListPage.routePath,
      builder: (context, state) => const ProductListPage(),
    ),
    GoRoute(
      path: OrdersListPage.routePath,
      builder: (context, state) => const OrdersListPage(),
    ),
     GoRoute(
      path: ProductsAddPage.routePath,
      builder: (context, state) => const ProductsAddPage(),
    )
  ],
);
