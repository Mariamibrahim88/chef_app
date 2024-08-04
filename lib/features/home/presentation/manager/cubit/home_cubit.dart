import 'package:chef_app/features/home/presentation/manager/cubit/home_state.dart';
import 'package:chef_app/features/menu/presentation/views/menu_view.dart';
import 'package:chef_app/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int currentIndex = 0;
  List<Widget> screens = [const MenuView(), const ProfileView()];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexState());
  }
}
