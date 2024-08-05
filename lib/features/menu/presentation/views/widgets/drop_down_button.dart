import 'package:chef_app/core/local/app_local.dart';
import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/features/menu/presentation/manager/cubit/menu_cubit.dart';
import 'package:flutter/material.dart';

class dropDownButton extends StatelessWidget {
  const dropDownButton({
    super.key,
    required this.menu,
  });

  final MenuCubit menu;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        dropdownColor: AppColors.Basecolor,
        isExpanded: true,
        value: menu.selectedItem,
        style: Theme.of(context)
            .textTheme!
            .displaySmall!
            .copyWith(color: Colors.white),
        borderRadius: BorderRadius.circular(
          16,
        ),
        hint: Text(
          AppString.category.tr(context),
          //style: Theme.of(context).textTheme!.displaySmall,
        ),
        items: menu.categoryList
            .map((e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ))
            .toList(),
        onChanged: (data) {
          menu.changItem(data);
        });
  }
}
