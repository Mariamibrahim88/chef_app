import 'package:chef_app/core/local/app_local.dart';
import 'package:chef_app/core/utils/app_strings.dart';
import 'package:chef_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:chef_app/features/menu/presentation/views/widgets/list_of_menu_item.dart';
import 'package:chef_app/features/menu/presentation/views/widgets/menu_item.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuViewBody extends StatelessWidget {
  const MenuViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Center(
        child: Column(
          children: [
            CustomButton(
              text: AppString.addToMenu.tr(context),
              onPressed: () {},
            ),
            const Expanded(
              child: ListOfItemMenu(),
            ),
          ],
        ),
      ),
    );
  }
}
