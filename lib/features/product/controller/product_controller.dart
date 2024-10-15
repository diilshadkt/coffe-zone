import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_zone/features/product/model/product_model.dart';
import 'package:coffee_zone/features/product/services/product_firestore_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'product_controller.g.dart';

final productsDb = FirebaseFirestore.instance
    .collection('products')
    .withConverter(
        fromFirestore: ProductModel.fromFirestore,
        toFirestore: (model, _) => model.toFirestore());

@riverpod
Stream<List<ProductModel>> getAllProducts(GetAllProductsRef ref) async* {
  final productStream = productsDb.snapshots(includeMetadataChanges: true);
  await for (final products in productStream) {
    yield [
      for (final product in products.docs) product.data(),
    ];
  }
}

Future<void> addNewProduct(ProductModel model) async {
  ProductFirestoreService().add(ProductModel(
      id: "",
      imagePath: "",
      name: model.name,
      description: model.description,
      categoryId: model.categoryId,
      types: model.types,
      availableFrom: model.availableFrom,
      availableUpTo: model.availableUpTo));
}

Future<void> deleteProduct(String id) async {
  ProductFirestoreService().delete(id);
}

Future<void> updateProduct(ProductModel updateModel) async {
  ProductFirestoreService().update(ProductModel(
      id: "",
      imagePath: "",
      name: updateModel.name,
      description: updateModel.description,
      categoryId: updateModel.categoryId,
      types: updateModel.types,
      availableFrom: updateModel.availableFrom,
      availableUpTo: updateModel.availableUpTo));
}
