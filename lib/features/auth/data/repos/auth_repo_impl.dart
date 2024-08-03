import 'package:chef_app/core/errors/failure.dart';
import 'package:chef_app/core/remote/api_consumer.dart';
import 'package:chef_app/core/remote/api_service.dart';
import 'package:chef_app/core/remote/end_points.dart';
import 'package:chef_app/core/service/service_locator.dart';
import 'package:chef_app/features/auth/data/models/login_model.dart';
import 'package:chef_app/features/auth/data/models/send_code_model.dart';
import 'package:chef_app/features/auth/data/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);
  @override
  Future<Either<Failure, LoginModel>> signIn(
      {required String email, required String password}) async {
    try {
      // final response = await sl<ApiConsumer>().post(EndPoint.chefsignIn, data: {
      //   'email': email,
      //   'password': password,
      final response = await apiService.post(EndPoint.chefsignIn, {
        'email': email,
        'password': password,
      });
      final user = LoginModel.fromJson(response);
      return Right(user);

      // if(response.data){
      //   return Right(LoginModel.fromJson(response));
      // }
    } catch (e) {
      if (e is DioException) {
        print('nooooooooooooooooo');
        return (Left(ServerFailure.fromDioException(e)));
      }
      return (left(ServerFailure(e.toString())));
    }
  }

  @override
  Future<Either<Failure, SendCodeModel>> sendCode(
      {required String email}) async {
    try {
      final response = await apiService.post(EndPoint.sendCode, {
        ApiKeys.email: email,
      });
      final userr = SendCodeModel.fromJson(response);
      return Right(userr);
    } catch (e) {
      if (e is DioException) {
        print('nooooooooooooooooo');
        return (Left(ServerFailure.fromDioException(e)));
      }
      return (left(ServerFailure(e.toString())));
    }
  }
}
