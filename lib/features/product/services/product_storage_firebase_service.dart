import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class ProductStorageFirebaseService {
  final storageRef = FirebaseStorage.instance.ref();

  Future<String> add(File image, String fileName) async {
    await storageRef.child('product/$fileName').putFile(image);
    final filePath = storageRef.child('product/$fileName').fullPath;
    return filePath;
  }

  Future<void> delete(String fileName) async {
    await storageRef.child('product/$fileName').delete();
  }
}
