import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextFieldWidget extends ConsumerWidget {
  final String textFielTitle;
  final String hintText;
  final TextEditingController controller;
  const TextFieldWidget(
      {super.key,
      required this.textFielTitle,
      required this.hintText,
      required this.controller});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textFielTitle,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              hintText: hintText,
              hintStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 186, 186, 186)),
              border: const OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ],
    );
  }
}
