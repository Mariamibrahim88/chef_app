import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class googleNavBar extends StatelessWidget {
  const googleNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 10),
      child: GNav(
          activeColor: AppColors.primaryColor,
          gap: 5,
          selectedIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
          onTabChange: (value) {
            BlocProvider.of<HomeCubit>(context).changeIndex(value);
          },
          tabBackgroundColor: Colors.white.withOpacity(0.1),
          tabBorderRadius: 18,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          tabs: const [
            GButton(
              icon: Icons.menu_outlined,
              iconColor: AppColors.grey,
              iconSize: 28,
              // text: 'Menu',
            ),
            GButton(
              icon: Icons.person_2_outlined,
              iconSize: 28,
              iconColor: AppColors.grey,
              //text: 'Profile',
            )
          ]),
    );
  }
}
