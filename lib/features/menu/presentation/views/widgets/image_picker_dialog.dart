import 'package:chef_app/core/local/app_local.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_spacing.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class imagePickerDialog extends StatelessWidget {
  const imagePickerDialog({
    super.key,
    required this.cameraOnTap,
    required this.galleryOnTap,
  });
  // diff between it and fun it doesnt need parms
  final VoidCallback cameraOnTap;
  final VoidCallback galleryOnTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(
              Icons.camera_alt,
              color: AppColors.primaryColor,
            ),
            title: Text(
              AppString.camera.tr(context),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              cameraOnTap();
            },
          ),
          verticalSpace(4),
          ListTile(
            leading: const Icon(
              Icons.photo_album_outlined,
              color: AppColors.primaryColor,
            ),
            title: Text(
              AppString.gallery.tr(context),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              galleryOnTap();
            },
          )
        ],
      ),
    );
  }
}
