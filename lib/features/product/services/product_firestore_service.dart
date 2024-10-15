import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_zone/features/product/model/product_model.dart';

class ProductFirestoreService {
  static final productDb = FirebaseFirestore.instance
      .collection("products")
      .withConverter(
          fromFirestore: ProductModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());

  Future<void> add(ProductModel addModel) async {
    await productDb.doc(addModel.name).set(addModel);
  }

  Future<void> delete(String id) async {
    await productDb.doc(id).delete();
  }

  Future<void> update(ProductModel updateModel) async {
    await productDb.doc(updateModel.id).set(updateModel);
  }
}
