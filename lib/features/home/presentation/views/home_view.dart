import 'package:chef_app/core/widgets/google_nav_bar.dart';
import 'package:chef_app/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:chef_app/features/home/presentation/manager/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: BlocProvider.of<HomeCubit>(context)
                .screens[BlocProvider.of<HomeCubit>(context).currentIndex],
            bottomNavigationBar: const googleNavBar(),
          ),
        );
      },
    );
  }
}
