
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:news_app_flutter/app_utils/utils.dart';

import 'exception.dart';

class DioInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{

    try{

      if(await AppUtils.checkInternetConnection()){

        log('--> ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${'${options.baseUrl}${options.path}'}');

        log('Headers:');
        options.headers.forEach((k, v) => log('$k: $v'));
        log('queryParameters:');
        options.queryParameters.forEach((k, v) => log('$k: $v'));

        if (options.data != null) {
          log('Body: ${options.data}');
        }

        log('--> END ${options.method != null ? options.method.toUpperCase() : 'METHOD'}');
      }else{
        throw DataException.customException('noInternet');
      }
    }catch(e){
      log('interceptorException ${e.toString()}');
    }

    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('<-- ${err.message} ${(err.response?.requestOptions != null ? (err.response?.requestOptions.baseUrl) : 'URL')}');
    log('${err.response != null ? err.response!.data : 'Unknown Error'}');
    log('<-- End error');
    throw DataException.fromDioError(err);
    // return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('<-- ${response.statusCode} ${(response.requestOptions != null ? (response.requestOptions.baseUrl + response.requestOptions.path) : 'URL')}');
    log('Headers:');
    response.headers.forEach((k, v) => log('$k: $v'));
    log('Response: ${response.data}');
    log('<-- END HTTP');

    return handler.next(response);
  }

}