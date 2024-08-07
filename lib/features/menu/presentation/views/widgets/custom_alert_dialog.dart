import 'package:chef_app/core/local/app_local.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.text,
    required this.confirmAction,
  });
  final String text;
  final VoidCallback confirmAction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.grey,
      content: Text(
        //AppString.cancel.tr(context),
        text,
        style: regularStyle().copyWith(fontWeight: FontWeight.bold),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            AppString.cancel.tr(context),
            style: regularStyle(),
          ),
        ),
        TextButton(
          onPressed: confirmAction,
          child: Text(
            AppString.ok.tr(context),
            style: regularStyle(),
          ),
        ),
      ],
    );
  }
}
