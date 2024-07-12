import 'package:coffee_zone/core/extensions/localization_extension.dart';
import 'package:coffee_zone/core/widgets/button_widget.dart';
import 'package:coffee_zone/core/widgets/text_field_widget.dart';
import 'package:coffee_zone/features/auth/controller/auth_controller.dart';
import 'package:coffee_zone/features/auth/view/pages/signup_page.dart';
import 'package:coffee_zone/features/auth/view/widgets/forgot_password_bottom_sheet_widget.dart';
import 'package:coffee_zone/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends HookWidget {
  static const routePath = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginFormKey = useMemoized(() => GlobalKey<FormState>());
    final forgotFormKey = useMemoized(() => GlobalKey<FormState>());

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final forgotEmailController = useTextEditingController();

    final isLoadingState = useState(false);

    return Scaffold(
      body: Builder(builder: (context) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: Form(
              key: loginFormKey,
              child: ListView(
                children: [
                  Text(
                    context.text.loginPageTitle,
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
                    controller: emailController,
                    validator: AuthController().validateEmail,
                    label: context.text.emailFieldLabel,
                  ),
                  const SizedBox(height: 16),
                  TextFieldWidget(
                    controller: passwordController,
                    validator: AuthController().validatePassword,
                    isObscure: true,
                    label: context.text.passwordFieldLabel,
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        showBottomSheet(
                            context: context,
                            builder: (context) {
                              return ForgotPasswordBottomSheetWidget(
                                  forgotEmailController: forgotEmailController,
                                  forgotFormKey: forgotFormKey,
                                  isLoadingState: isLoadingState);
                            });
                      },
                      child: Text(
                        context.text.forgotPasswordLink,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ButtonWidget(
                      onPressed: () async {
                        isLoadingState.value = true;

                        if (loginFormKey.currentState!.validate()) {
                          await AuthController().login(
                              emailController.text, passwordController.text);
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
                          : Text(context.text.loginBtnLabel),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ButtonWidget(
                      isBold: false,
                      onPressed: () {
                        context.push(SignupPage.routePath);
                      },
                      child: Text(context.text.createAccountBtnLabel),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
