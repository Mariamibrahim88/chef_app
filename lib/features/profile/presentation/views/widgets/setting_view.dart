import 'package:chef_app/core/cubit/global_cubit_cubit.dart';
import 'package:chef_app/core/cubit/global_cubit_state.dart';
import 'package:chef_app/core/routes/app_routes.dart';
import 'package:chef_app/core/utils/app_spacing.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/features/splash/presentation/views/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<GlobalCubitCubit, GlobalCubitState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButtom(
                text: 'English',
                onTap: () {
                  BlocProvider.of<GlobalCubitCubit>(context).changeLang('en');
                  Navigator.pop(context);

                  //navigate(context: context, route: Navigator.pop(context));
                },
              ),
              verticalSpace(25),
              CustomButtom(
                text: 'العربية',
                onTap: () {
                  BlocProvider.of<GlobalCubitCubit>(context).changeLang('ar');
                  Navigator.pop(context);
                  //navigate(context: context, route: Routes.login);
                },
              ),
            ],
          ),
        );
      },
    ));
  }
}
