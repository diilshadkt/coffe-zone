import 'package:coffee_zone/core/utils/snackbar_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_controller.freezed.dart';
part 'category_controller.g.dart';

/// State for the category controller
@freezed
class CategoryControllerState with _$CategoryControllerState {
  factory CategoryControllerState({
    required int selectedCategory,
    required List<String> allCategories,
  }) = _CategoryControllerState;
}

@riverpod
class CategoryController extends _$CategoryController {
  @override
  CategoryControllerState build() {
    return CategoryControllerState(selectedCategory: 0, allCategories: [
      'Coffee',
    ]);
  }

  Future<void> addNewCategory(String categoryName) async {
    state =
        state.copyWith(allCategories: [...state.allCategories, categoryName]);
  }

  Future<void> deleteCategory() async {
    if (state.allCategories.length > 1) {
      state = state.copyWith(
          allCategories: [...state.allCategories]
            ..removeAt(state.selectedCategory));
    } else {
      SnackbarUtils.showMessage(
          'Cannot delete category. Atleast 1 category is required.');
    }
  }

  Future<void> renameCategory(String newName) async {
    final newCategories = [...state.allCategories];
    newCategories[state.selectedCategory] = newName;

    state = state.copyWith(allCategories: newCategories);
  }

  Future<void> onMenuItemSelected(int value) async {}
}
