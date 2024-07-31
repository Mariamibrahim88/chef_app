import 'package:chef_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text, required this.onPressed});

  String text;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.07,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppColors.white, fontSize: 18),
          )),
    );
  }
}
