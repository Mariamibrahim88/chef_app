import 'package:cached_network_image/cached_network_image.dart';
import 'package:chef_app/core/local/app_local.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/utils/app_text_style.dart';
import 'package:chef_app/features/menu/data/models/meal_model.dart';
import 'package:chef_app/features/menu/presentation/manager/cubit/menu_cubit.dart';
import 'package:chef_app/features/menu/presentation/manager/cubit/menu_state.dart';
import 'package:chef_app/features/menu/presentation/views/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class menuItem extends StatelessWidget {
  const menuItem({
    super.key,
    required this.mealModel,
  });

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 120.h,
        child: Card(
          shadowColor: Colors.white.withOpacity(0.1),
          color: Colors.white.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: mealModel.images[0],
                  width: 60.w,
                  height: 70.h,
                  fit: BoxFit.fill,
                  placeholder: (context, url) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 60.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    );
                  },
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(mealModel.name,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontWeight: FontWeight.bold)),
                      SizedBox(
                        //width: 180.w,
                        child: Text(mealModel.description,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.displaySmall),
                      ),
                      Text(
                          mealModel.price.toString() + AppString.le.tr(context),
                          style: Theme.of(context).textTheme.displaySmall),
                    ],
                  ),
                ),
                const Spacer(),
                BlocConsumer<MenuCubit, MenuState>(
                  builder: (context, state) {
                    return Card(
                        child: IconButton(
                      icon: const Icon(Icons.cancel),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return CustomAlertDialog(
                                text: AppString.deleteMeal.tr(context),
                                confirmAction: () {
                                  BlocProvider.of<MenuCubit>(context)
                                      .deleteMeal(mealModel.id);
                                  Navigator.of(context).pop();
                                },
                              );
                            });
                      },
                    ));
                  },
                  listener: (BuildContext context, MenuState state) {
                    if (state is DeleteMealSuccessState) {
                      BlocProvider.of<MenuCubit>(context).getMeals();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
