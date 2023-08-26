
import 'package:dio/dio.dart';


class DataException implements Exception {

  static String message = "Sorry for the inconvenience caused! Please try again later!";


  DataException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = 'Your request has been cancelled';
        break;
      case DioErrorType.connectTimeout:
        message = 'Please Try Later! Your Network seems to be slow';
        break;
      case DioErrorType.receiveTimeout:
        message = 'Please Try Later! Something went wrong';
        break;
      case DioErrorType.response:
        message = _handleError(dioError.response!.statusCode!);
        break;
      case DioErrorType.sendTimeout:
        message = 'Please Try Later! Something went wrong';
        break;
      default:  if(dioError.message == 'SocketException') {
        customException('noInternet');
      }
      break;
    }
  }

  static customException(String errorMessage) {
    if(errorMessage == 'noInternet')
    message = 'Please Check if the Internet Connection is working!';
    return errorMessage;
  }

  String _handleError(int statusCode) {
    switch (statusCode) {
      default:
        return 'Please Try Later! Something went wrong';
    }
  }

  @override
  String toString() => message;
}
