import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://food-api-omega.vercel.app/api/v1/';
  final Dio _dio;

  ApiService(this._dio);

//post request

  Future post(String endPoint, {dynamic data, bool isFormData = false}) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: isFormData ? FormData.fromMap(data) : data,
    );
    return response.data;
  }

  // patch request

  Future patch(String endPoint, dynamic data) async {
    var response = await _dio.patch('$_baseUrl$endPoint', data: data);
    return response.data;
  }

  Future get(String endPoint) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }

  // Future<List<dynamic>> get({required String endPoint}) async {
  //   var response = await _dio.get('$_baseUrl$endPoint');
  //   return response.data;
  //   //return response;
  // }

  Future delete(String endPoint,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    final res = await _dio.delete('$_baseUrl$endPoint',
        data: data, queryParameters: queryParameters);
    return res.data;
  }

  // Future<MovieModel>>

  Future<Map<String, dynamic>> getById({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
    //return response;
  }
}
