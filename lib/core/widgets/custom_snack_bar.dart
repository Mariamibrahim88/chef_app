import 'package:chef_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

void ShowSnackBar(BuildContext context, String message, Color color) {
  final snackBar = SnackBar(
    backgroundColor: color,
    padding: const EdgeInsets.all(16.0),
    content: Text(
      message,
      style: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: Colors.white,
          ),
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    duration: const Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

// void CustomShowToast(BuildContext context, String message, Color color) {
//   Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.CENTER,
//       timeInSecForIosWeb: 1,
//       backgroundColor: color,
//       textColor: Colors.white,
//       fontSize: 16.0);
// }
