import 'package:chef_app/core/local/app_local.dart';
import 'package:chef_app/core/utils/app_spacing.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/widgets/custom_text_field.dart';
import 'package:chef_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:chef_app/features/splash/presentation/views/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SendCodeViewBody extends StatelessWidget {
  const SendCodeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Center(
          child: Column(
            children: [
              //verticalSpace(1),
              // Center(
              SizedBox(
                height: 200.h,
                width: 220.w,
                child: SvgPicture.asset(
                  'assets/images/Key-amico.svg',
                ),
              ),
              // ),
              verticalSpace(30),
              Text(
                  textAlign: TextAlign.center,
                  AppString.sendResetLinkInfo.tr(context),
                  style: Theme.of(context).textTheme.displaySmall),
              verticalSpace(30),
              CustomTextFormField(
                hintText: AppString.email.tr(context),
                obscureText: false,
              ),
              verticalSpace(35),
              CustomButton(
                  text: AppString.sendResetLink.tr(context), onPressed: () {})
            ],
          ),
        ),
      ),
    );
    // );
  }
}
