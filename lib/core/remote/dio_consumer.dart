import 'package:chef_app/core/remote/api_consumer.dart';
import 'package:chef_app/core/remote/api_interceptors.dart';
import 'package:chef_app/core/remote/end_points.dart';
import 'package:dio/dio.dart';

class DioConsumer extends ApiConsumer {
  Dio dio;
  DioConsumer(this.dio) {
    dio.options.baseUrl = EndPoint.baseurl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }
  @override
  Future delete(path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    final res =
        await dio.delete(path, data: data, queryParameters: queryParameters);
    return res.data;
  }

  @override
  Future get(path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    final res =
        await dio.get(path, data: data, queryParameters: queryParameters);
    return res.data;
  }

  @override
  Future patch(
    path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool isFormData = false,
  }) async {
    final res = await dio.patch(
      path,
      data: isFormData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
      options: options,
    );
    return res.data;
  }

  @override
  Future post(path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    final res = await dio.post(path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters);
  }
}
