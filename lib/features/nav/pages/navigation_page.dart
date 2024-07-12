import 'package:coffee_zone/core/widgets/button_widget.dart';
import 'package:coffee_zone/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatelessWidget {
  static const routePath = '/';

  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ButtonWidget(
            onPressed: () {
              AuthController().logout();
            },
            child: const Text('LOGOUT')),
      ),
    );
  }
}
