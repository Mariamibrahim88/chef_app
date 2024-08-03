import 'package:chef_app/core/local/app_local.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_spacing.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/core/widgets/custom_loading.dart';
import 'package:chef_app/core/widgets/custom_snack_bar.dart';
import 'package:chef_app/core/widgets/custom_text_field.dart';
import 'package:chef_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:chef_app/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:chef_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:chef_app/features/splash/presentation/views/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                ShowSnackBar(
                    context, AppString.checkMail.tr(context), Colors.green);
                // GoRouter.of(context).push('/homeView');
                navigateReplacement(context: context, route: Routes.resetPassw);
              } else if (state is AuthFailure) {
                ShowSnackBar(context,
                    AppString.pleaseEnterValidEmail.tr(context), Colors.red);
                // state.message.tr(context)
              }
            },
            builder: (context, state) {
              return Form(
                key: BlocProvider.of<AuthCubit>(context).formTwoKey,
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppString.pleaseEnterValidEmail.tr(context);
                        } else if (!value.contains('@gmail.com')) {
                          return AppString.pleaseEnterValidEmail.tr(context);
                        }
                      },
                      hintText: AppString.email.tr(context),
                      textcontroller:
                          BlocProvider.of<AuthCubit>(context).emailController,
                      obscureText: false,
                    ),
                    verticalSpace(35),
                    state is AuthLoading
                        ? const CustomLoading()
                        : CustomButton(
                            text: AppString.sendResetLink.tr(context),
                            onPressed: () {
                              if (BlocProvider.of<AuthCubit>(context)
                                  .formTwoKey
                                  .currentState!
                                  .validate()) {
                                BlocProvider.of<AuthCubit>(context).sendCode();
                              }
                            })
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
    // );
  }
}
