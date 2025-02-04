import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate');
      case DioExceptionType.cancel:
        return ServerFailure('Request Cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);

      case DioExceptionType.unknown:
        if (dioException.message?.contains('SocketException') == true) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unknown Error');

      default:
        return ServerFailure('UnExpected Error');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      final errorMessage = response['Error']?.isNotEmpty == true
          ? response['Error'][0]
          : response['ErrorMessage'] ??
              response['message'] ??
              response['error'] ??
              'An error occurred.';
      return ServerFailure(errorMessage);
      //return ServerFailure(resonse['Error'][0] || resonse['ErrorMessage']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not Found');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error');
    } else {
      return ServerFailure('There was an error , please try later !');
    }
  }
}
