import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void navigate(
    {required BuildContext context, required String route, dynamic arg}) {
  Navigator.pushNamed(context, route, arguments: arg);
}

void navigateReplacement(
    {required BuildContext context, required String route, dynamic arg}) {
  Navigator.pushReplacementNamed(context, route, arguments: arg);
}

Future<XFile?> pickImage({required ImageSource source}) async {
  final XFile? image = await ImagePicker().pickImage(source: source);
  if (image != null) {
    return image;
  } else {
    return null;
  }
}

Future<MultipartFile> uploadImageToApi(XFile image) async {
  return MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}


// Future uploadImageToAPI(XFile image) async {
//   return MultipartFile.fromFile(image.path,
//       filename: image.path.split('/').last);
// }
