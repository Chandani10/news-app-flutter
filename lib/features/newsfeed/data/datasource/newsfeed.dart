

import 'package:dio/dio.dart';

abstract class NewsFeed{

  Future<Response> getNews(String pathParam,String countryCode,Map<String,dynamic> queryParams);

}