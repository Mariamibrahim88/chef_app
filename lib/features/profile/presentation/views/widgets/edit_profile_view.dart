import 'package:chef_app/core/local/app_local.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_spacing.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/core/widgets/custom_app_bar.dart';
import 'package:chef_app/core/widgets/custom_loading.dart';
import 'package:chef_app/core/widgets/custom_snack_bar.dart';
import 'package:chef_app/core/widgets/custom_text_field.dart';
import 'package:chef_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:chef_app/features/menu/presentation/views/widgets/custom_file_image.dart';
import 'package:chef_app/features/menu/presentation/views/widgets/image_picker_dialog.dart';
import 'package:chef_app/features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBar(
            text: AppString.editProfile.tr(context),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          body: SingleChildScrollView(
            child: BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                if (state is ProfileUpdateSuccess) {
                  ShowSnackBar(
                      context, AppString.updatesucc.tr(context), Colors.green);
                  BlocProvider.of<ProfileCubit>(context).getChefData();
                  navigateReplacement(context: context, route: Routes.home);
                } else if (state is ProfileUpdateFailure) {
                  ShowSnackBar(context, state.message, Colors.red);
                }
              },
              builder: (context, state) {
                final updateChef = BlocProvider.of<ProfileCubit>(context);
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Form(
                      key: updateChef.updateProfileKey,
                      child: Column(
                        children: [
                          Stack(children: [
                            CustomFileImage(
                              image: updateChef.imgPic,
                            ),
                            Positioned.directional(
                              textDirection: Directionality.of(context),
                              bottom: 25,
                              end: 30,
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return imagePickerDialog(
                                          cameraOnTap: () {
                                            Navigator.pop(context);
                                            pickImage(
                                                    source: ImageSource.camera)
                                                .then((value) => updateChef
                                                    .uploadProfilePic(value!));
                                            // Capture a photo.
                                          },
                                          galleryOnTap: () {
                                            Navigator.pop(context);

                                            pickImage(
                                                    source: ImageSource.gallery)
                                                .then((value) => updateChef
                                                    .uploadProfilePic(value!));
                                          },
                                        );
                                      });
                                },
                                child: const Icon(
                                  Icons.add_a_photo,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ]),
                          CustomTextFormField(
                            hintText: AppString.name.tr(context),
                            obscureText: false,
                            textcontroller: updateChef.chefNameController,
                          ),
                          verticalSpace(5),
                          CustomTextFormField(
                              hintText: AppString.phoneNumber.tr(context),
                              obscureText: false,
                              textcontroller: updateChef.chefPhoneController),
                          verticalSpace(5),
                          CustomTextFormField(
                              hintText: AppString.nameBrand.tr(context),
                              obscureText: false,
                              textcontroller: updateChef.chefBrandController),
                          verticalSpace(5),
                          CustomTextFormField(
                              hintText: AppString.description.tr(context),
                              obscureText: false,
                              textcontroller: updateChef.chefDescController),
                          verticalSpace(5),
                          CustomTextFormField(
                              hintText: AppString.minimum.tr(context),
                              obscureText: false,
                              textcontroller: updateChef.chefChargeController),
                          verticalSpace(20),
                          // CustomTextFormField(
                          //   hintText: 'location',
                          //   obscureText: false,
                          //   textcontroller: updateChef.chefLocationController,
                          // ),
                          // verticalSpace(5),
                          state is ProfileUpdateLoading
                              ? const CustomLoading()
                              : CustomButton(
                                  text: AppString.update.tr(context),
                                  onPressed: () {
                                    BlocProvider.of<ProfileCubit>(context)
                                        .updateProfile();
                                  })
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}
