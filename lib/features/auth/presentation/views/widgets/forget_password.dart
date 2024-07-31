import 'package:chef_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Forget Password?');
      },
      child: Container(
        child: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Forget Password?',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
