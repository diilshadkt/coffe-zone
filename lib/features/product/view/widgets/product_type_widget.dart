import 'package:coffee_zone/core/extensions/theme_extension.dart';
import 'package:coffee_zone/features/product/view/widgets/edit_field_widget.dart';
import 'package:coffee_zone/features/product/view/widgets/elevated_type_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Model class to handle the text editing controller
final class ProductTypeControllers {
  final TextEditingController nameController;
  final TextEditingController priceController;

  ProductTypeControllers(
      {required this.nameController, required this.priceController});
}

class ProductTypeWidget extends HookConsumerWidget {
  final String hint;
  final TextStyle? style;
  final ValueNotifier<List<ProductTypeControllers>> productTypes;
  final String btntxt;
  final void Function(int) onTap;

  const ProductTypeWidget({
    super.key,
    required this.hint,
    required this.style,
    required this.productTypes,
    required this.btntxt,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void addNewTypeEntry() {
      productTypes.value = [
        ...productTypes.value,
        ProductTypeControllers(
          nameController: TextEditingController(),
          priceController: TextEditingController(),
        ),
      ];
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < productTypes.value.length; i++)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: EditFieldWidget(
                    hintText: hint,
                    controller: productTypes.value[i].nameController,
                    onChanged: null,
                    style: style,
                  ),
                ),
                Expanded(
                  child: EditFieldWidget(
                    hintText: "Enter Price",
                    controller: productTypes.value[i].priceController,
                    isPrice: true,
                    style: style,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),

                /// Delete Button
                InkWell(
                    onTap: () => onTap(i),
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: context.colors.primary,
                      child: const Icon(
                        Icons.remove,
                        size: 17,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 50,
          child: ElevatedAddButtonWidget(
              buttonText: btntxt,
              textColor: context.colors.primary,
              onPressed: () => addNewTypeEntry(),
              icon: Icons.add),
        ),
      ],
    );
  }
}
