import 'package:chef_app/core/utils/app_text_style.dart';
import 'package:chef_app/core/widgets/custom_loading.dart';
import 'package:chef_app/features/menu/presentation/manager/cubit/menu_cubit.dart';
import 'package:chef_app/features/menu/presentation/manager/cubit/menu_state.dart';
import 'package:chef_app/features/menu/presentation/views/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfItemMenu extends StatelessWidget {
  const ListOfItemMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        final menu = BlocProvider.of<MenuCubit>(context);
        return state is GetMealLoadingState
            ? const Center(
                child: CustomLoading(),
              )
            : menu.meals.isEmpty
                ? const Center(
                    child: Text(
                    'No meals added yet',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ))
                : ListView.builder(
                    itemCount: menu.meals.length,
                    itemBuilder: (context, index) {
                      return menuItem(
                        mealModel: menu.meals[index],
                      );
                    });
      },
    );
  }
}
