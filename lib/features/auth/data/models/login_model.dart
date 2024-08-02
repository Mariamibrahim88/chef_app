import 'package:chef_app/core/remote/end_points.dart';

class LoginModel {
  final String message;
  final String token;

  LoginModel({
    required this.message,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json[ApiKeys.message],
      token: json[ApiKeys.token],
    );
  }
}
