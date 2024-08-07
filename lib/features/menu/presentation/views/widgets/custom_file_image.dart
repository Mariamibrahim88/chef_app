import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class CustomFileImage extends StatelessWidget {
  const CustomFileImage({super.key, this.image});

  final XFile? image;

  @override
  Widget build(BuildContext context) {
    return image != null
        ? CircleAvatar(
            radius: 80.w,
            backgroundImage: FileImage(
              File(image!.path),
            ),
          )
        : Image.asset('assets/images/Ellipse.png', height: 200, width: 200);
  }
}
// height: 200, width: 200, fit: BoxFit.fill