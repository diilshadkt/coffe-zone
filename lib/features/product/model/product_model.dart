import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_zone/features/product/model/product_type_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_model.g.dart';
part 'product_model.freezed.dart';

@freezed
class ProductModel with _$ProductModel {
  const ProductModel._();

  factory ProductModel({
     required String id,
    required String imagePath,
    required String name,
    required String description,
    required String categoryId,
    required List<ProductTypeModel> types,
    required String availableFrom,
    required String availableUpTo,
  }) = _ProductModel;
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  factory ProductModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    data['id'] = snapshot.id;
    return ProductModel.fromJson(data);
  }
  Map<String, dynamic> toFirestore() {
    return toJson()..remove('id');
  }
}
