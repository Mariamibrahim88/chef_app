import 'package:chef_app/core/errors/failure.dart';
import 'package:chef_app/features/menu/data/models/meal_model.dart';
import 'package:chef_app/features/menu/data/models/menu_model.dart';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

abstract class MenuRepos {
  Future<Either<Failure, menuModel>> addMealToMenu({
    required String mealName,
    required String mealDesc,
    required double mealPrice,
    required String howToSell,
    required XFile? image,
    required String category,
  });

  Future<Either<Failure, String>> deleteMeal({
    required String id,
  });

  Future<Either<Failure, GetAllMealsModel>> getMeals();
}
