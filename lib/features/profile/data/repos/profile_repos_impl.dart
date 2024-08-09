import 'package:chef_app/core/database/cache_helper.dart';
import 'package:chef_app/core/errors/failure.dart';
import 'package:chef_app/core/remote/api_consumer.dart';
import 'package:chef_app/core/remote/api_service.dart';
import 'package:chef_app/core/remote/end_points.dart';
import 'package:chef_app/core/service/service_locator.dart';
import 'package:chef_app/core/utils/commons.dart';
import 'package:chef_app/features/menu/presentation/manager/cubit/menu_state.dart';
import 'package:chef_app/features/profile/data/models/chef_model.dart';
import 'package:chef_app/features/profile/data/repos/profile_repos.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class profileRepoImp implements profileRepo {
  final ApiService apiService;

  profileRepoImp(this.apiService);

  @override
  Future<Either<Failure, chefModel>> getChafData() async {
    try {
      final response = await sl<ApiConsumer>().get(
          EndPoint.getchefdata(sl<CacheHelper>().getData(key: ApiKeys.id)));
      //  final response = await sl<ApiConsumer>().get(
      //   EndPoint.getchefmeal(sl<CacheHelper>().getData(key: ApiKeys.id)),
      // );

      final chef = chefModel.fromJson(response);

      return Right(chef);
    } catch (e) {
      if (e is DioException) {
        print('no meals');
        return (Left(ServerFailure.fromDioException(e)));
      }
      return (left(ServerFailure(e.toString())));
    }
  }

  @override
  Future<Either<Failure, String>> updateProfile(
      {String? name,
      String? phone,
      String? brandName,
      String? minCharge,
      XFile? profilePic,
      var location,
      String? disc}) async {
    try {
      final response = await sl<ApiConsumer>()
          .patch(EndPoint.updteChef, isFormData: true, data: {
        'name': name,
        'phone': phone,
        'brandName': brandName,
        'minCharge': minCharge,
        'profilePic': await uploadImageToApi(profilePic!),
        'location':
            '{"name":"Egypt","address":"quantra","coordinates":[12345678,87654321]}',
        'disc': disc
      });
      return Right(response['message']);
    } catch (e) {
      if (e is DioException) {
        print('no meals');
        return (Left(ServerFailure.fromDioException(e)));
      }
      return (left(ServerFailure(e.toString())));
    }
  }

  @override
  Future<Either<Failure, String>> logout() async {
    try {
      final response = await sl<ApiConsumer>().get(EndPoint.logout);
      return Right(response['message']);
    } catch (e) {
      if (e is DioException) {
        print('no meals');
        return (Left(ServerFailure.fromDioException(e)));
      }
      return (left(ServerFailure(e.toString())));
    }
  }
}
