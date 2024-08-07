import 'package:chef_app/core/errors/failure.dart';
import 'package:chef_app/features/menu/data/models/meal_model.dart';
import 'package:chef_app/features/menu/data/models/menu_model.dart';
import 'package:chef_app/features/menu/data/repos/menu_repos.dart';
import 'package:chef_app/features/menu/data/repos/menu_repos_imp.dart';
import 'package:chef_app/features/menu/presentation/manager/cubit/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit(this.menuRepos) : super(MenuInitial());

  //final MenuRepos menuRepos;
  final MenuRepos menuRepos;

  XFile? image;
  final mealNameController = TextEditingController();
  final mealPriceController = TextEditingController();
  final mealDescController = TextEditingController();
  List<MealModel> meals = [];

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List categoryList = [
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

  String selectedItem = "Beef";

  void changItem(item) {
    selectedItem = item;
    emit(ChangItemState());
  }

  String groupVal = "quantity";

  void changeGroupVal(val) {
    groupVal = val;
    emit(ChangeGroupValState());
  }

  void uploadMealPic(XFile val) {
    image = val;
    emit(UploadImage());
  }

  void addMealToMenu() async {
    emit(AddMealLoadingState());

    final result = await menuRepos.addMealToMenu(
      mealName: mealNameController.text,
      mealDesc: mealDescController.text,
      mealPrice: double.parse(mealPriceController.text),
      howToSell: groupVal,
      image: image,
      category: selectedItem,
    );

    result.fold((Failure) => emit(AddMealFailureState(Failure.message)),
        (menuModel) => emit(AddMealSuccessState()));
  }

  Future<void> deleteMeal(id) async {
    emit(DeleteMealLoadingState());

    final result = await menuRepos.deleteMeal(id: id);
    result.fold((Failure) => emit(DeleteMealFailureState(Failure.message)),
        (r) => emit(DeleteMealSuccessState()));
  }

  Future<void> getMeals() async {
    emit(GetMealLoadingState());

    final result = await menuRepos.getMeals();
    result.fold((Failure) => emit(GetMealFailureState(Failure.message)), (r) {
      meals = r.meals;

      emit(GetMealSuccessState());
    });
  }
}
