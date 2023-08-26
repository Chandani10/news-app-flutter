

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'interceptor.dart';

final clientProvider = Provider((ref) => Dio(BaseOptions(
    connectTimeout: 10000,
    baseUrl: 'https://newsapi.org/v2/'))
  ..interceptors.add(DioInterceptor())
  ..interceptors.add(LogInterceptor(
    request: true,
    requestHeader: true,
    requestBody: true,
    responseHeader: true,
    responseBody: true,
  ))
);
