import 'package:coffee_zone/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class ElevatedAddButtonWidget extends StatelessWidget {
  final String buttonText;

  final Color textColor;
  final void Function()? onPressed;
  final IconData? icon;

  const ElevatedAddButtonWidget(
      {super.key,
      required this.buttonText,
      required this.textColor,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            side: BorderSide(color: context.colors.primary),
            elevation: 0,
            backgroundColor: Colors.white,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: context.colors.primary,
              size: 22,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              buttonText,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
