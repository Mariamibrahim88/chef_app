import 'package:chef_app/core/local/app_local.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_spacing.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/core/widgets/custom_loading.dart';
import 'package:chef_app/core/widgets/custom_snack_bar.dart';
import 'package:chef_app/core/widgets/custom_text_field.dart';
import 'package:chef_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:chef_app/features/menu/presentation/manager/cubit/menu_cubit.dart';
import 'package:chef_app/features/menu/presentation/manager/cubit/menu_state.dart';
import 'package:chef_app/features/menu/presentation/views/widgets/custom_alert_dialog.dart';
import 'package:chef_app/features/menu/presentation/views/widgets/drop_down_button.dart';
import 'package:chef_app/features/menu/presentation/views/widgets/image_picker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddMealViewBody extends StatelessWidget {
  const AddMealViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: SingleChildScrollView(
        child: Center(
          child: BlocConsumer<MenuCubit, MenuState>(
            listener: (context, state) {
              if (state is AddMealSuccessState) {
                ShowSnackBar(
                    context, AppString.mealAddedSucessfully, Colors.green);
                Navigator.pop(context);
                // showDialog(
                //     context: context,
                //     builder: (context) {
                //       return CustomAlertDialog(
                //           text: AppString.mealAddedSucessfully.tr(context),
                //           confirmAction: () {
                //             Navigator.pop(context);
                //             //Navigator.pop(context);
                //           });
                //     });
              } else if (state is AddMealFailureState) {
                ShowSnackBar(context, state.message, Colors.red);
              }
            },
            builder: (context, state) {
              final menu = BlocProvider.of<MenuCubit>(context);
              return Form(
                key: menu.formKey,
                child: Column(
                  children: [
                    Stack(children: [
                      Image.asset('assets/images/Ellipse.png',
                          height: 200, width: 200),
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
                                      pickImage(source: ImageSource.camera)
                                          .then((value) => menu.image = value);
                                      // Capture a photo.
                                    },
                                    galleryOnTap: () {
                                      Navigator.pop(context);

                                      pickImage(source: ImageSource.gallery)
                                          .then((value) => menu.image = value);
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
                    verticalSpace(10),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppString.pleaseEnterValidEmail.tr(context);
                        }
                      },
                      textcontroller: menu.mealNameController,
                      hintText: AppString.mealName.tr(context),
                      obscureText: false,
                    ),
                    verticalSpace(8),
                    CustomTextFormField(
                      validator: (value) {
                        if (num.tryParse(value!) == null) {
                          return AppString.pleaseEnterValidCode.tr(context);
                        }

                        if (value!.isEmpty) {
                          return AppString.pleaseEnterValidCode.tr(context);
                        }
                      },
                      textcontroller: menu.mealPriceController,
                      hintText: AppString.mealPrice.tr(context),
                      obscureText: false,
                    ),
                    verticalSpace(8),
                    Container(
                      height: 65.h,
                      width: 390.w,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: dropDownButton(menu: menu),
                      ),
                    ),
                    verticalSpace(8),
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppString.pleaseEnterValidEmail.tr(context);
                        }
                      },
                      textcontroller: menu.mealDescController,
                      hintText: AppString.mealDesc.tr(context),
                      obscureText: false,
                    ),
                    verticalSpace(12),
                    Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                                activeColor: AppColors.primaryColor,
                                value: "number",
                                groupValue: menu.groupVal,
                                onChanged: (val) {
                                  menu.changeGroupVal(val);
                                }),
                            Text(
                              AppString.mealNumber.tr(context),
                              style: Theme.of(context).textTheme!.displaySmall!,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Radio(
                                activeColor: AppColors.primaryColor,
                                value: "quantity",
                                groupValue: menu.groupVal,
                                onChanged: (val) {
                                  menu.changeGroupVal(val);
                                }),
                            Text(AppString.mealQuantity.tr(context),
                                style:
                                    Theme.of(context).textTheme!.displaySmall!),
                          ],
                        )
                      ],
                    ),
                    verticalSpace(25),
                    state is AddMealLoadingState
                        ? CustomLoading()
                        : CustomButton(
                            text: AppString.addDishToMenu.tr(context),
                            onPressed: () {
                              //if (menu.formKey.currentState!.validate()) {
                              menu.addMealToMenu();
                              //}
                            })
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
