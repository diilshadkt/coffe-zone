import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_zone/core/utils/snackbar_utils.dart';
import 'package:coffee_zone/features/product/model/category_model.dart';
import 'package:coffee_zone/features/product/services/category_firestore_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_controller.freezed.dart';
part 'category_controller.g.dart';

/// State for the category controller
@freezed
class CategoryControllerState with _$CategoryControllerState {
  factory CategoryControllerState({
    required int selectedCategory,
  }) = _CategoryControllerState;
}

final categoryDb = FirebaseFirestore.instance
    .collection("categories")
    .withConverter(
        fromFirestore: CategoryModel.fromFirestore,
        toFirestore: (model, _) => model.toFirestore());
// Stream provider to get all categories
@riverpod
Stream<List<CategoryModel>> getAllCategory(GetAllCategoryRef ref) async* {
  final categoryStream = categoryDb.snapshots(includeMetadataChanges: true);
  await for (final categories in categoryStream) {
    yield [
      for (final category in categories.docs) category.data(),
    ];
  }
}

@riverpod
class CategoryController extends _$CategoryController {
  @override
  CategoryControllerState build() {
    return CategoryControllerState(
      selectedCategory: 0,
    );
  }

  Future<void> addNewCategory(String categoryName) async {
    CategoryFirestoreService().add(CategoryModel(id: '', name: categoryName));
  }

  Future<void> deleteCategory() async {
    if (ref.read(getAllCategoryProvider).value!.length > 1) {
      final currentCategory =
          ref.read(getAllCategoryProvider).value![state.selectedCategory];

      CategoryFirestoreService().delete(currentCategory.id);
    } else {
      SnackbarUtils.showMessage(
          'Cannot delete category. Atleast 1 category is required.');
    }
  }

  Future<void> renameCategory(String newName) async {
    CategoryFirestoreService().update(CategoryModel(id: "", name: newName));
  }

  Future<void> onMenuItemSelected(int value) async {}
}


  