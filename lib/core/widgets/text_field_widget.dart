import 'package:coffee_zone/core/extensions/localization_extension.dart';
import 'package:coffee_zone/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TextFieldWidget extends HookWidget {
  final String? label;
  final String? hintText;
  final bool isObscure;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const TextFieldWidget({
    super.key,
    this.hintText,
    this.label,
    this.isObscure = false,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final isObscureState = useState(isObscure);

    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isObscureState.value,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.colors.primary,
          ),
        ),
        label: label != null ? Text(label!) : null,
        suffix: isObscure
            ? GestureDetector(
                onTap: () {
                  isObscureState.value = !isObscureState.value;
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    isObscureState.value
                        ? context.text.showPasswordLink
                        : context.text.hidePasswordLink,
                    style: TextStyle(
                      fontSize: 12,
                      color: context.colors.primary,
                    ),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
