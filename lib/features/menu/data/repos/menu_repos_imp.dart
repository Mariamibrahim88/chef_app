import 'package:chef_app/core/database/cache_helper.dart';
import 'package:chef_app/core/errors/failure.dart';
import 'package:chef_app/core/remote/api_consumer.dart';
import 'package:chef_app/core/remote/api_service.dart';
import 'package:chef_app/core/remote/end_points.dart';
import 'package:chef_app/core/service/service_locator.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/features/menu/data/models/meal_model.dart';
import 'package:chef_app/features/menu/data/models/menu_model.dart';
import 'package:chef_app/features/menu/data/repos/menu_repos.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class menuRepoImp implements MenuRepos {
  final ApiService apiService;

  menuRepoImp(this.apiService);
  @override
  Future<Either<Failure, menuModel>> addMealToMenu(
      {required XFile? image,
      required String mealName,
      required String howToSell,
      required String mealDesc,
      required String category,
      required double mealPrice}) async {
    try {
      final MultipartFile uploadedImage = await uploadImageToApi(image!);
      final response = await apiService.post(
        EndPoint.addMeal,
        isFormData: true,
        data: {
          'mealImages': uploadedImage,
          'name': mealName,
          'howToSell': howToSell,
          'description': mealDesc,
          'category': category,
          'price': mealPrice
        },
      );

      final userr = menuModel.fromJson(response);

      return Right(userr);

      // return Right(userr);
    } catch (e) {
      if (e is DioException) {
        print('no meals');
        return (Left(ServerFailure.fromDioException(e)));
      }
      return (left(ServerFailure(e.toString())));
    }
  }

  @override
  Future<Either<Failure, String>> deleteMeal({required String id}) async {
    try {
      final response = await apiService.delete(EndPoint.deletemeal(id));

      return Right(response[ApiKeys.message]);
    } catch (e) {
      if (e is DioException) {
        print('nooooooooooooooooo');
        return (Left(ServerFailure.fromDioException(e)));
      }
      return (left(ServerFailure(e.toString())));
    }
  }

  @override
  Future<Either<Failure, GetAllMealsModel>> getChefsMeals() async {
    try {
      final response = await apiService.get(
        EndPoint.getchefmeal(sl<CacheHelper>().getData(key: ApiKeys.id)),
      );

      return Right(GetAllMealsModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        print('nooooooooooooooooo');
        return (Left(ServerFailure.fromDioException(e)));
      }
      return (left(ServerFailure(e.toString())));
    }
  }
}


//getchefmeal