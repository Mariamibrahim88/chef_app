import 'package:chef_app/core/local/app_local.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_spacing.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/widgets/custom_text_field.dart';
import 'package:chef_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:chef_app/features/auth/presentation/views/widgets/dont_have_account.dart';
import 'package:chef_app/features/auth/presentation/views/widgets/forget_password.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
    //   if (state is LoginInSuccess) {
    //     ShowSnackBar(context, 'success', Colors.green);
    //     GoRouter.of(context).push('/homeView');
    //   } else if (state is LoginInFailure) {
    //     ShowSnackBar(context, state.message, Colors.red);
    //   }
    // }, builder: (context, state) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 36),
          child: Form(
            //key: context.read<LoginCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppString.welcomeBack.tr(context),
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: AppColors.primaryColor)),
                verticalSpace(20),
                Text(
                    'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                    style: Theme.of(context).textTheme.displaySmall),

                verticalSpace(35),
                CustomTextFormField(
                  //textcontroller: context.read<LoginCubit>().emailController,
                  hintText: 'email',
                  obscureText: false,
                ),
                verticalSpace(20),
                CustomTextFormField(
                  // textcontroller:context.read<LoginCubit>().passwordController,
                  hintText: 'password',
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
                CustomButton(
                    text: 'Login',
                    onPressed: () {
                      // if (context
                      //     .read<LoginCubit>()
                      //     .formKey
                      //     .currentState!
                      //     .validate()) {
                      //   context.read<LoginCubit>().signIn();
                      // }
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
  }
}
//   }
// }
