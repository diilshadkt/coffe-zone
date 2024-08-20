import 'dart:async';
import 'package:coffee_zone/core/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  static Future<XFile?> pickImageFromCamera(BuildContext context) async {
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      return pickedImage;
    } else {
      Future.sync(
        () => SnackbarUtils.showMessage("No Image picked"),
      );
      return null;
    }
  }

  static Future<XFile?> pickImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      return pickedImage;
    } else {
      Future.sync(
        () => SnackbarUtils.showMessage("No Image picked"),
      );
      return null;
    }
  }

  static Future<XFile?> showDialogueForImagePicker(
    BuildContext context, [
    bool showDeleteOption = false,
  ]) async {
    final imageCompleter = Completer<XFile?>();
    await showDialog(
      context: context,
      builder: (context) {

        return AlertDialog(
        
          title: Consumer(
            builder: (context, ref, child) {
             

              return Column(
                children: [
                  TextButton(
                      onPressed: () async {
                        imageCompleter.complete(
                            await ImagePickerUtils.pickImageFromCamera(
                                context));
                        Future.sync(() => context.pop());
                      },
                      child: const Text("Camera",
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500))),
                  TextButton(
                      onPressed: () async {
                        imageCompleter.complete(
                          await ImagePickerUtils.pickImageFromGallery(context),
                        );
                        Future.sync(() => context.pop());
                      },
                      child: const Text("Gallery",
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500))),

                  /// Show the delete option if required
                  if (showDeleteOption)
                    TextButton(
                        onPressed: () async {
                          /// An empty path is given to remove the selected image
                          imageCompleter.complete(
                            XFile(''),
                          );
                          Future.sync(() => context.pop());
                        },
                        child:const Text("Delete",
                            style:  TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.red))),
                ],
              );
            },
          ),
        );
      },
    );

    final imageSelected = await (imageCompleter.future);
    return imageSelected;
  }
}
