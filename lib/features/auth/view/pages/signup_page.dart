import 'package:coffee_zone/core/extensions/localization_extension.dart';
import 'package:coffee_zone/core/widgets/button_widget.dart';
import 'package:coffee_zone/core/widgets/text_field_widget.dart';
import 'package:coffee_zone/features/auth/controller/auth_controller.dart';
import 'package:coffee_zone/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SignupPage extends HookWidget {
  static const routePath = '/signup';

  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmController = useTextEditingController();

    /// A state that indicate if the signup process is in progress
    final isLoadingState = useState(false);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  Text(
                    context.text.signupPageTitle,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    context.text.signupPageSubtitle,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Image.asset(Assets.images.signup.path),
                    ),
                  ),
                  TextFieldWidget(
                    label: context.text.emailFieldLabel,
                    validator: AuthController().validateEmail,
                    controller: emailController,
                  ),
                  const SizedBox(height: 16),
                  TextFieldWidget(
                    isObscure: true,
                    validator: AuthController().validatePassword,
                    label: context.text.passwordFieldLabel,
                    controller: passwordController,
                  ),
                  const SizedBox(height: 16),
                  TextFieldWidget(
                    isObscure: true,
                    validator: (value) => AuthController()
                        .validateConfirm(passwordController.text, value),
                    label: context.text.confirmPasswordLabel,
                    controller: confirmController,
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ButtonWidget(
                      onPressed: () async {
                        isLoadingState.value = true;

                        if (formKey.currentState!.validate()) {
                          await AuthController().createAccount(
                            emailController.text,
                            passwordController.text,
                          );
                        }

                        isLoadingState.value = false;
                      },
                      child: isLoadingState.value
                          ? const Center(
                              child: SizedBox(
                                height: 16,
                                width: 16,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : Text(context.text.createAccountBtnLabel),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
