// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllCategoryHash() => r'71bcaad47c74172a58e3ac363dae437ca0990e07';

/// See also [getAllCategory].
@ProviderFor(getAllCategory)
final getAllCategoryProvider =
    AutoDisposeStreamProvider<List<CategoryModel>>.internal(
  getAllCategory,
  name: r'getAllCategoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAllCategoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllCategoryRef = AutoDisposeStreamProviderRef<List<CategoryModel>>;
String _$categoryControllerHash() =>
    r'87de3a214463dad6456c5e1a977fb4a410b8b1cc';

/// See also [CategoryController].
@ProviderFor(CategoryController)
final categoryControllerProvider = AutoDisposeNotifierProvider<
    CategoryController, CategoryControllerState>.internal(
  CategoryController.new,
  name: r'categoryControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoryControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CategoryController = AutoDisposeNotifier<CategoryControllerState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
