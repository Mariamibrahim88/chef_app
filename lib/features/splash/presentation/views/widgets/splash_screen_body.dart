import 'package:chef_app/core/utils/app_spacing.dart';
import 'package:chef_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreenViewBody extends StatelessWidget {
  const SplashScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 170.h,
            width: 170.w,
            child: SvgPicture.asset(
              'assets/images/female chef-pana.svg',
              // height: 200,
            ),
          ),
          verticalSpace(20),
          Text(
            'Chef App',
            style: Theme.of(context).textTheme.displayLarge,
          )
        ],
      ),
    );
  }
}
