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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Center(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                ShowSnackBar(
                    context, AppString.checkMail.tr(context), Colors.green);
                // GoRouter.of(context).push('/homeView');
                navigateReplacement(context: context, route: Routes.login);
              } else if (state is AuthFailure) {
                ShowSnackBar(context, state.message.tr(context), Colors.red);
                // state.message.tr(context)
              }
            },
            builder: (context, state) {
              return Form(
                key: BlocProvider.of<AuthCubit>(context).formresetKey,
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
                        textAlign: TextAlign.start,
                        AppString.createYourNewPassword.tr(context),
                        style: Theme.of(context).textTheme.displaySmall),
                    verticalSpace(30),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.length < 6) {
                          return AppString.pleaseEnterValidPassword.tr(context);
                        } else if (value!.isEmpty) {
                          return AppString.pleaseEnterValidPassword.tr(context);
                        }
                      },
                      textcontroller: BlocProvider.of<AuthCubit>(context)
                          .newPasswordController,
                      hintText: AppString.newPassword.tr(context),
                      obscureText: true,
                    ),
                    verticalSpace(10),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.length < 6 || value!.isEmpty) {
                          return AppString.pleaseEnterValidPassword.tr(context);
                        } else if (value !=
                            BlocProvider.of<AuthCubit>(context)
                                .newPasswordController
                                .text) {
                          return AppString.pleaseEnterValidPassword.tr(context);
                        }
                      },
                      textcontroller: BlocProvider.of<AuthCubit>(context)
                          .confirmPasswordController,
                      hintText: AppString.confirmPassword.tr(context),
                      obscureText: true,
                    ),
                    verticalSpace(10),
                    CustomTextFormField(
                      validator: (value) {
                        if (num.tryParse(value!) == null) {
                          return AppString.pleaseEnterValidCode.tr(context);
                        }

                        if (value!.isEmpty) {
                          return AppString.pleaseEnterValidCode.tr(context);
                        }
                      },
                      textcontroller:
                          BlocProvider.of<AuthCubit>(context).codeController,
                      hintText: AppString.code.tr(context),
                      obscureText: false,
                    ),
                    verticalSpace(20),
                    state is AuthLoading
                        ? const CustomLoading()
                        : CustomButton(
                            text: AppString.resetpassword.tr(context),
                            onPressed: () {
                              if (BlocProvider.of<AuthCubit>(context)
                                  .formresetKey
                                  .currentState!
                                  .validate()) {
                                BlocProvider.of<AuthCubit>(context)
                                    .resetPassword();
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
  }
}
