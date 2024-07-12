import 'package:coffee_zone/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final bool isBold;
  final bool isDense;

  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.child,
    this.isBold = true,
    this.isDense = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(
          isDense
              ? null
              : const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
        ),
        foregroundColor: WidgetStatePropertyAll(
            isBold ? Colors.white : context.colors.primary),
        backgroundColor:
            WidgetStatePropertyAll(isBold ? context.colors.primary : null),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: child,
    );
  }
}
