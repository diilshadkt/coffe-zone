import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_zone/features/product/model/category_model.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class CategoryFirestoreService {
  static final categoryDb = FirebaseFirestore.instance
      .collection("categories")
      .withConverter(
          fromFirestore: CategoryModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());

  Future<void> add(CategoryModel model) async {
    await categoryDb.doc(model.name.toLowerCase().trim()).set(model);
  }

  Future<void> delete(String id) async {
    await categoryDb.doc(id).delete();
  }

  Future<void> update(CategoryModel updatedModel) async {
    await categoryDb.doc(updatedModel.id).set(updatedModel);
  }

  Stream<List<CategoryModel>> getAll() async* {
    final categoryStream = categoryDb.snapshots(includeMetadataChanges: true);
    await for (final categories in categoryStream) {
      yield [
        for (final category in categories.docs) category.data(),
      ];
    }
  }
}
