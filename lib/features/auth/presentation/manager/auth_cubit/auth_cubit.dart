import 'package:chef_app/core/database/cache_helper.dart';
import 'package:chef_app/core/errors/failure.dart';
import 'package:chef_app/core/remote/end_points.dart';
import 'package:chef_app/core/service/service_locator.dart';
import 'package:chef_app/features/auth/data/models/reset_pass_model.dart';
import 'package:chef_app/features/auth/data/models/send_code_model.dart';
import 'package:chef_app/features/auth/data/repos/auth_repo.dart';
import 'package:chef_app/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final codeController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //var formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formTwoKey = GlobalKey<FormState>();
  GlobalKey<FormState> formresetKey = GlobalKey<FormState>();

  final AuthRepo authRepo;
  Future<void> login() async {
    emit(AuthLoading());
    final result = await authRepo.signIn(
        email: emailController.text, password: passwordController.text);

    result.fold((Failure) => emit(AuthFailure(Failure.message)),
        (LoginModel) async {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(LoginModel.token);

      await sl<CacheHelper>()
          .saveData(key: ApiKeys.id, value: decodedToken[ApiKeys.id]);
      await sl<CacheHelper>()
          .saveData(key: ApiKeys.token, value: LoginModel.token);
      emit(AuthSuccess());
    });
  }

  Future<void> sendCode() async {
    emit(AuthLoading());
    final result = await authRepo.sendCode(email: emailController.text);
    result.fold((Failure) => emit(AuthFailure(Failure.message)),
        (SendCodeModel) => emit(AuthSuccess()));
  }

  Future<void> resetPassword() async {
    emit(AuthLoading());
    final result = await authRepo.resetPassword(
        email: emailController.text,
        code: codeController.text,
        confirmPassword: confirmPasswordController.text,
        password: newPasswordController.text);

    result.fold((Failure) => emit(AuthFailure(Failure.message)),
        (resetPassModel) => emit(AuthSuccess()));
  }
}
