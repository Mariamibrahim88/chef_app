import 'package:chef_app/core/local/app_local.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/core/widgets/custom_app_bar.dart';
import 'package:chef_app/features/menu/presentation/views/widgets/add_meal_view_body.dart';
import 'package:flutter/material.dart';

class AddMealView extends StatelessWidget {
  const AddMealView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
              text: AppString.addToMenu.tr(context),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            body: const AddMealViewBody()));
  }
}
