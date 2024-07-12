import 'package:coffee_zone/core/extensions/localization_extension.dart';
import 'package:coffee_zone/core/widgets/button_widget.dart';
import 'package:coffee_zone/core/widgets/text_field_widget.dart';
import 'package:coffee_zone/features/auth/controller/auth_controller.dart';
import 'package:coffee_zone/features/product/controller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RenameCatogaryBottomSheetWidget extends ConsumerWidget {
  const RenameCatogaryBottomSheetWidget({
    super.key,
    required this.renameCatogaryController,
  });

  final TextEditingController renameCatogaryController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomSheet(onClosing: () {
      renameCatogaryController.clear();
    }, builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.text.renameCategoryBottomSheetTitle,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                )),
            const SizedBox(height: 16),
            TextFieldWidget(
              controller: renameCatogaryController,
            ),
            const SizedBox(height: 24),
            SizedBox(
                width: double.infinity,
                child: ButtonWidget(
                    onPressed: () {
                      ref
                          .read(categoryControllerProvider.notifier)
                          .renameCategory(renameCatogaryController.text);
                    },
                    child: Text(context.text.renameCategoryBottomSheetTitle)))
          ],
        ),
      );
    });
  }
}
