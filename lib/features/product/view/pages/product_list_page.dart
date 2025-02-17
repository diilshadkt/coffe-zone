import 'package:coffee_zone/core/extensions/localization_extension.dart';
import 'package:coffee_zone/core/extensions/theme_extension.dart';
import 'package:coffee_zone/features/product/controller/category_controller.dart';
import 'package:coffee_zone/features/product/view/pages/products_add_page.dart';
import 'package:coffee_zone/features/product/view/widgets/add_catogary_bottom_sheet_widget.dart';
import 'package:coffee_zone/features/product/view/widgets/rename_category_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductListPage extends HookConsumerWidget {
  static const routePath = '/products';

  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final categoriesState = ref.watch(categoryControllerProvider);
    final addCategoryController = useTextEditingController();
    final renameCategoryController = useTextEditingController();
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );

    return Builder(builder: (context) {
      return switch (ref.watch(getAllCategoryProvider)) {
        AsyncData(:final value) => DefaultTabController(
            length: value.length,

            child: Scaffold(
              appBar: AppBar(
                title: Text(context.text.ordersBottomNavItem),
                bottom: TabBar(
                  tabs: [
                    for (final category in value)
                      Tab(
                        text: category.name,
                      )
                  ],
                ),
                actions: [
                  PopupMenuButton(
                    onSelected: (value) {
                      switch (value) {
                        case 1:
                          showBottomSheet(
                              context: context,
                              elevation: 1,
                              enableDrag: true,
                              showDragHandle: true,
                              transitionAnimationController:
                                  animationController,
                              builder: (context) {
                                return AddCatogaryBottomSheetWidget(
                                    addCatogaryController:
                                        addCategoryController);
                              });
                          break;
                        case 2:
                          showBottomSheet(
                              context: context,
                              elevation: 1,
                              enableDrag: true,
                              showDragHandle: true,
                              transitionAnimationController:
                                  animationController,
                              builder: (context) {
                                return RenameCatogaryBottomSheetWidget(
                                    renameCatogaryController:
                                        renameCategoryController);
                              });
                          break;
                        case 3:
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: const Text("Are you confirm to delete?"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => context.pop(),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    ref
                                        .read(
                                            categoryControllerProvider.notifier)
                                        .deleteCategory();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                      }
                    },
                    icon: const Icon(Icons.more_vert),
                    itemBuilder: (context) => <PopupMenuEntry<int>>[
                      const PopupMenuItem(
                        value: 1,
                        child: Text('Add new category'),
                      ),
                      const PopupMenuItem(
                        value: 2,
                        child: Text('Rename this category'),
                      ),
                      const PopupMenuItem(
                        value: 3,
                        child: Text('Delete this category'),
                      ),
                    ],
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                  backgroundColor: context.colors.primary,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.add),
                  onPressed: () {
                    context.go(ProductsAddPage.routePath);
                  }),
            ),
          ),
           AsyncError() => const Center(
                child: Center(
                  child: Text('Error while getting data'),
                ),
              ),
            _ => const Center(
                child: CircularProgressIndicator(),
              )
      };
      
    });
  }
}
