import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditFieldWidget extends ConsumerWidget {
  final String hintText;
  final bool isPrice;
  final TextEditingController controller;
  final bool? enabled;
  final bool? cursor;
  final void Function(String)? onChanged;
  final TextStyle? style;
  const EditFieldWidget(
      {super.key,
      required this.hintText,
      required this.controller,
      this.isPrice = false,
      this.enabled,
      this.onChanged,
      required this.style,
      this.cursor});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      showCursor: cursor,
      controller: controller,
      onChanged: onChanged,
      enabled: enabled,
      style: style,
      textAlign: isPrice ? TextAlign.right : TextAlign.left,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.all(0),
        hintText: hintText,
        hintStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 186, 186, 186)),
        hintTextDirection: TextDirection.rtl,
        border: InputBorder.none,
      ),
    );
  }
}
