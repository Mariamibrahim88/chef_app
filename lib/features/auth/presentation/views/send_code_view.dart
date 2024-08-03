import 'package:chef_app/core/local/app_local.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/utils/app_text_style.dart';
import 'package:chef_app/core/widgets/custom_app_bar.dart';
import 'package:chef_app/features/auth/presentation/views/widgets/send_code_view_body.dart';
import 'package:flutter/material.dart';

class SendCodeView extends StatelessWidget {
  const SendCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppString.forgetPassword.tr(context),
        ),
        body: const SendCodeViewBody(),
      ),
    );
  }
}
