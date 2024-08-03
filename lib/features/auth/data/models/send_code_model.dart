import 'package:chef_app/core/remote/end_points.dart';

class SendCodeModel {
  final String message;

  SendCodeModel({required this.message});

  factory SendCodeModel.fromJson(Map<String, dynamic> json) {
    return SendCodeModel(
      message: json[ApiKeys.message],
    );
  }
}
