import 'package:coffee_zone/core/extensions/localization_extension.dart';
import 'package:coffee_zone/core/widgets/button_widget.dart';
import 'package:coffee_zone/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  static const routePath = '/';

  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 200,
                  ),
                  child: Center(
                    child: Image.asset(Assets.images.landing.path),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.sizeOf(context).width * 0.7),
                child: Text(
                  context.text.landingTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                context.text.landingMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonWidget(
                    isDense: false,
                    onPressed: () {},
                    child: Text(context.text.loginBtnLabel),
                  ),
                  const SizedBox(width: 16),
                  ButtonWidget(
                    isBold: false,
                    isDense: false,
                    onPressed: () {},
                    child: Text(context.text.registerBtnLabel),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
