import 'package:chef_app/core/local/app_local.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/widgets/custom_app_bar.dart';
import 'package:chef_app/features/auth/presentation/views/widgets/reset_view_pass_body.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppString.createYourNewPassword.tr(context),
        ),
        body: const ResetPasswordViewBody(),
      ),
    );
  }
}
