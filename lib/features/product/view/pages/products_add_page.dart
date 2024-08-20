import 'package:coffee_zone/core/widgets/button_widget.dart';
import 'package:coffee_zone/features/product/view/pages/product_list_page.dart';
import 'package:coffee_zone/features/product/view/widgets/appbar_widget.dart';
import 'package:coffee_zone/features/product/view/widgets/image_picker_widget.dart';
import 'package:coffee_zone/features/product/view/widgets/product_type_widget.dart';
import 'package:coffee_zone/features/product/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductsAddPage extends HookConsumerWidget {
  static const routePath = '/productsAdd';

  const ProductsAddPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productNameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final productTypeControllers = useState<List<ProductTypeControllers>>([]);
    final productAddonControllers = useState<List<ProductTypeControllers>>([]);

    /// Remove a type from the product
    void removeProductType(int index) {
      final controllersToDelete = productTypeControllers.value[index];

      productTypeControllers.value = [...productTypeControllers.value]
        ..removeAt(index);

      controllersToDelete.nameController.dispose();
      controllersToDelete.priceController.dispose();
    }

    /// Remove an addon from the product
    void removeProductAddon(int index) {
      final controllersToDelete = productAddonControllers.value[index];

      productAddonControllers.value = [...productAddonControllers.value]
        ..removeAt(index);

      controllersToDelete.nameController.dispose();
      controllersToDelete.priceController.dispose();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: AppbarWidget(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const ImagePickerWidget(),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFieldWidget(
                        textFielTitle: "Product Name",
                        hintText: "Enter Item Name...",
                        controller: productNameController),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFieldWidget(
                        textFielTitle: "Description",
                        hintText: "Enter Description...",
                        controller: descriptionController),
                    const SizedBox(
                      height: 16,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Type",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                    SizedBox(
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return ProductTypeWidget(
                              hint: "Type",
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 186, 186, 186)),
                              productTypes: productTypeControllers,
                              btntxt: "Type",
                              onTap: removeProductType);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ButtonWidget(onPressed: () {}, child: const Text("Save")),
      ),
    );
  }
}
