import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/core/local/app_local.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_spacing.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/utils/app_text_style.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/core/widgets/custom_loading.dart';
import 'package:chef_app/features/menu/presentation/views/widgets/custom_alert_dialog.dart';
import 'package:chef_app/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:chef_app/features/profile/presentation/views/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // if (state is GetChafSuccess) {
        //   return print('good');
        // }
      },
      builder: (context, state) {
        return //final cheff = BlocProvider.of<ProfileCubit>(context);
            state is GetChafSuccess
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Center(
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: state.chef
                                .profilePic, //BlocProvider.of<ProfileCubit>(context).chef!.profilePic,
                            imageBuilder: (context, imageProvider) => Container(
                              width: 190.w,
                              height: 190.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Text(
                            state.chef.name,
                            //sl<C
                            //acheHelper>().getData(key: 'name'),
                            // 'Mariam Ibrahim ',
                            style: boldStyle(),
                          ),
                          verticalSpace(5),
                          Text(
                            state.chef.email,
                            style: regularStyle().copyWith(
                                color: Colors.grey.withOpacity(0.8),
                                fontSize: 16.sp),
                          ),
                          verticalSpace(30),
                          Column(
                            children: [
                              CustomIcon(
                                  text: AppString.editProfile.tr(context),
                                  icon: Icons.person_2_outlined,
                                  confirmAction: () {
                                    navigate(
                                        context: context,
                                        route: Routes.editProfile);
                                  }),
                              verticalSpace(15),
                              CustomIcon(
                                text: AppString.password.tr(context),
                                icon: Icons.lock_outline,
                                confirmAction: () {},
                              ),
                              verticalSpace(15),
                              CustomIcon(
                                text: AppString.settings.tr(context),
                                icon: Icons.settings,
                                confirmAction: () {
                                  navigate(
                                      context: context, route: Routes.setting);
                                },
                              ),
                              verticalSpace(15),
                              CustomIcon(
                                text: AppString.logout.tr(context),
                                icon: Icons.logout,
                                confirmAction: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return CustomAlertDialog(
                                          text: AppString.logout.tr(context),
                                          confirmAction: () {
                                            BlocProvider.of<ProfileCubit>(
                                                    context)
                                                .logout();
                                            navigateReplacement(
                                                context: context,
                                                route: Routes.login);
                                          },
                                        );
                                      });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                : const Center(child: CustomLoading());
      },
    );
  }
}
