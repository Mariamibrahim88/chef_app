import 'package:chef_app/core/errors/failure.dart';
import 'package:chef_app/features/auth/data/models/login_model.dart';
import 'package:chef_app/features/auth/data/models/reset_pass_model.dart';
import 'package:chef_app/features/auth/data/models/send_code_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginModel>> signIn(
      {required String email, required String password});
  Future<Either<Failure, SendCodeModel>> sendCode({required String email});
  Future<Either<Failure, resetPassModel>> resetPassword(
      {required String email,
      required String code,
      required String confirmPassword,
      required String password});
}
