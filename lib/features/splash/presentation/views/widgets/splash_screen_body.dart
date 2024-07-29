import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_spacing.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreenViewBody extends StatefulWidget {
  const SplashScreenViewBody({super.key});

  @override
  State<SplashScreenViewBody> createState() => _SplashScreenViewBodyState();
}

class _SplashScreenViewBodyState extends State<SplashScreenViewBody> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

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

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      // Navigator.pushNamed(context, Routes.changLan);
      navigate(context: context, route: Routes.changLan);
    });
  }
}
