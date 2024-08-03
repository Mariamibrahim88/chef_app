import 'package:chef_app/core/remote/end_points.dart';

class resetPassModel {
  final String message;

  resetPassModel({required this.message});

  factory resetPassModel.fromJson(Map<String, dynamic> json) {
    return resetPassModel(
      message: json[ApiKeys.message],
    );
  }
}
