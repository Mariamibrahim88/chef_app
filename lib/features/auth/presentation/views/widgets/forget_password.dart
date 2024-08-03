import 'package:chef_app/core/local/app_local.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateReplacement(context: context, route: Routes.sendCode);
      },
      child: Container(
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            AppString.forgetPassword.tr(context),
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
