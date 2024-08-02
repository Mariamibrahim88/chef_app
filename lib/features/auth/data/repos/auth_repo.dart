import 'package:chef_app/core/errors/failure.dart';
import 'package:chef_app/features/auth/data/models/login_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginModel>> signIn(
      {required String email, required String password});
}
