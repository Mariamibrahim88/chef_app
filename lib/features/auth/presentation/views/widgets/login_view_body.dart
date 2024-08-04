import 'package:chef_app/core/local/app_local.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_spacing.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/core/widgets/custom_loading.dart';
import 'package:chef_app/core/widgets/custom_snack_bar.dart';
import 'package:chef_app/core/widgets/custom_text_field.dart';
import 'package:chef_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:chef_app/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:chef_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:chef_app/features/auth/presentation/views/widgets/dont_have_account.dart';
import 'package:chef_app/features/auth/presentation/views/widgets/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is AuthSuccess) {
        ShowSnackBar(
            context, AppString.loginSucessfully.tr(context), Colors.green);
        // GoRouter.of(context).push('/homeView');
        navigate(context: context, route: Routes.home);
      } else if (state is AuthFailure) {
        ShowSnackBar(context, state.message, Colors.red);
      }
    }, builder: (context, state) {
      return SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 36),
            child: Form(
              key: BlocProvider.of<AuthCubit>(context).formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppString.welcomeBack.tr(context),
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: AppColors.primaryColor)),
                  verticalSpace(20),
                  Text(AppString.welcomeSentence.tr(context),
                      style: Theme.of(context).textTheme.displaySmall),

                  verticalSpace(35),
                  CustomTextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppString.pleaseEnterValidEmail.tr(context);
                      } else if (!value.contains('@gmail.com')) {
                        return AppString.pleaseEnterValidEmail.tr(context);
                      }
                    },
                    textcontroller:
                        BlocProvider.of<AuthCubit>(context).emailController,
                    hintText: AppString.email.tr(context),
                    obscureText: false,
                  ),
                  verticalSpace(20),
                  CustomTextFormField(
                    validator: (value) {
                      if (value!.length < 6) {
                        return AppString.pleaseEnterValidPassword.tr(context);
                      } else if (value!.isEmpty) {
                        return AppString.pleaseEnterValidPassword.tr(context);
                      }
                    },
                    textcontroller:
                        BlocProvider.of<AuthCubit>(context).passwordController,
                    hintText: AppString.password.tr(context),
                    obscureText: true,
                  ),
                  verticalSpace(25),
                  const ForgetPassword(),
                  verticalSpace(30),

                  // SizedBox(height: 30),
                  // state is LoginInLoading
                  //     ? const Center(
                  //         child: CircularProgressIndicator(
                  //         color: Color.fromARGB(255, 110, 171, 112),
                  //       ))
                  //     :
                  state is AuthLoading
                      ? const CustomLoading()
                      : CustomButton(
                          text: AppString.signIn.tr(context),
                          onPressed: () {
                            if (BlocProvider.of<AuthCubit>(context)
                                .formKey
                                .currentState!
                                .validate()) {
                              BlocProvider.of<AuthCubit>(context).login();
                            }
                          }),
                  verticalSpace(20),
                  // const TermsAndConditionsTerm(),
                  // verticalSpace(40),
                  const DontHaveAnAccount(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
