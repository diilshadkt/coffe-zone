import 'package:coffee_zone/core/extensions/localization_extension.dart';
import 'package:coffee_zone/features/nav/controller/navigation_controller.dart';
import 'package:coffee_zone/features/order/view/pages/orders_list_page.dart';
import 'package:coffee_zone/features/product/view/pages/product_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavigationPage extends HookConsumerWidget {
  static const routePath = '/';

  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final pageController = usePageController();

    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (page) => ref
            .read(navigationControllerProvider.notifier)
            .changeSelectedPage(page, pageController),
        children: const [
          OrdersListPage(),
          ProductListPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (page) => ref
            .read(navigationControllerProvider.notifier)
            .changeSelectedPage(page, pageController),
        currentIndex: ref.watch(navigationControllerProvider),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart_outlined),
            activeIcon: const Icon(Icons.shopping_cart),
            label: context.text.ordersBottomNavItem,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.inventory_2_outlined),
            activeIcon: const Icon(Icons.inventory_2),
            label: context.text.productsBottomNavItem,
          )
        ],
      ),
    );
  }
}
