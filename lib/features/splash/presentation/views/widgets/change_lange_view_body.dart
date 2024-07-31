import 'package:chef_app/core/cubit/global_cubit_cubit.dart';
import 'package:chef_app/core/cubit/global_cubit_state.dart';
import 'package:chef_app/core/local/app_local.dart';
import 'package:chef_app/core/utils/app_assets.dart';
import 'package:chef_app/core/utils/app_spacing.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/features/splash/presentation/views/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChangeLangScreenBody extends StatelessWidget {
  const ChangeLangScreenBody({super.key});

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
            AppAssets.logo,
          ),
        ),
        verticalSpace(10),
        Text(
          AppString.welocmeToChefApp.tr(context),
          style: Theme.of(context).textTheme.displayLarge,
        ),
        verticalSpace(50),
        Text(
          AppString.pleaseSelectYourLanguage.tr(context),
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.white.withOpacity(0.4)),
        ),
        verticalSpace(40),
        BlocBuilder<GlobalCubitCubit, GlobalCubitState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtom(
                  text: 'English',
                  onTap: () {
                    BlocProvider.of<GlobalCubitCubit>(context).changeLang('en');
                  },
                ),
                CustomButtom(
                  text: 'العربية',
                  onTap: () {
                    BlocProvider.of<GlobalCubitCubit>(context).changeLang('ar');
                  },
                ),
              ],
            );
          },
        )
      ],
    ));
  }
}
