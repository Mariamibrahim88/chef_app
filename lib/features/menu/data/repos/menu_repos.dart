import 'package:chef_app/core/errors/failure.dart';
import 'package:chef_app/features/menu/data/models/meal_model.dart';
import 'package:chef_app/features/menu/data/models/menu_model.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class MenuRepos {
  Future<Either<Failure, menuModel>> addMealToMenu({
    required XFile? image,
    required String mealName,
    required String howToSell,
    required String mealDesc,
    required String category,
    required double mealPrice,
  });

  Future<Either<Failure, String>> deleteMeal({
    required String id,
  });

  Future<Either<Failure, GetAllMealsModel>> getChefsMeals();
}
