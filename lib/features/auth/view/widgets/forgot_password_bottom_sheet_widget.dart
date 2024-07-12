import 'package:coffee_zone/core/extensions/localization_extension.dart';
import 'package:coffee_zone/core/widgets/button_widget.dart';
import 'package:coffee_zone/core/widgets/text_field_widget.dart';
import 'package:coffee_zone/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';

class ForgotPasswordBottomSheetWidget extends StatelessWidget {
  const ForgotPasswordBottomSheetWidget({
    super.key,
    required this.forgotEmailController,
    required this.forgotFormKey,
    required this.isLoadingState,
  });

  final TextEditingController forgotEmailController;
  final GlobalKey<FormState> forgotFormKey;
  final ValueNotifier<bool> isLoadingState;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(onClosing: () {
      forgotEmailController.clear();
    }, builder: (context) {
      return Form(
        key: forgotFormKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.text.forgotPasswordLink,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  )),
              const SizedBox(height: 16),
              TextFieldWidget(
                label: context.text.emailFieldLabel,
                validator: AuthController().validateEmail,
                controller: forgotEmailController,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ButtonWidget(
                  onPressed: () async {
                    isLoadingState.value = true;

                    if (forgotFormKey.currentState!.validate()) {
                      AuthController()
                          .forgotPassword(forgotEmailController.text);
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
                      : Text(context.text.sendResetEmailBtnLabel),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
