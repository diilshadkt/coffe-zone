import 'package:coffee_zone/core/extensions/localization_extension.dart';
import 'package:coffee_zone/core/widgets/button_widget.dart';
import 'package:coffee_zone/core/widgets/text_field_widget.dart';
import 'package:coffee_zone/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const routePath = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.text.loginPageTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                context.text.loginPageSubtitle,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
              Expanded(
                child: Center(
                  child: Image.asset(Assets.images.login.path),
                ),
              ),
              TextFieldWidget(
                label: context.text.emailFieldLabel,
              ),
              const SizedBox(height: 16),
              TextFieldWidget(
                isObscure: true,
                label: context.text.passwordFieldLabel,
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    context.text.forgotPasswordLink,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ButtonWidget(
                  onPressed: () {},
                  child: Text(context.text.loginBtnLabel),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ButtonWidget(
                  isBold: false,
                  onPressed: () {},
                  child: Text(context.text.createAccountBtnLabel),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
