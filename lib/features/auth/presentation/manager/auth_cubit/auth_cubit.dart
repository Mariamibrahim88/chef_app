import 'package:chef_app/features/auth/data/repos/auth_repo.dart';
import 'package:chef_app/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //var formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final AuthRepo authRepo;
  Future<void> login() async {
    emit(AuthLoading());
    final result = await authRepo.signIn(
        email: emailController.text, password: passwordController.text);

    result.fold((Failure) => emit(AuthFailure(Failure.message)),
        (LoginModel) => emit(AuthSuccess()));
  }
}
