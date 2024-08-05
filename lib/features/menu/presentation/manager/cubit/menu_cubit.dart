import 'package:chef_app/features/menu/presentation/manager/cubit/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuInitial());

  XFile? image;
  final mealNameController = TextEditingController();
  final mealPriceController = TextEditingController();
  final mealDescController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List categoryList = [
    'meat',
    'Beef',
    'Chicken',
    'Fish',
    'Pork',
    'Lamb',
    'Soups',
    'Sandwiches',
    'Pasta',
    'Pizza',
    'Rice dishes',
    'Stir-fries',
    'Curries',
    'Desserts',
    'Seafoad',
    'Vegan',
    'Vegetarian',
    'Gluten_free'
  ];

  String selectedItem = "Fish";

  void changItem(item) {
    selectedItem = item;
    emit(ChangItemState());
  }

  String groupVal = "quantity";

  void changeGroupVal(val) {
    groupVal = val;
    emit(ChangeGroupValState());
  }
}
