

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:news_app_flutter/constant/export.dart';
import 'package:news_app_flutter/main.dart';

class NewsRepository {
  final ApiRepositoryApi apiRepository;
  NewsRepository(this.apiRepository);

  Future <List<Articles>> fetchNews() async {
    try {
      final res = await apiRepository.fetchNewsApiRequest();
      print("============${jsonEncode(res)}");
      final newsResponseModel=
      (res as List).map((e) => Articles.fromJson(e)).toList();
      return newsResponseModel;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      log(errorMessage.toString());
      rethrow;
    }
  }
}


final newsApiProvider = Provider<ApiRepositoryApi>((ref) {
  return ApiRepositoryApi(ref.read(dioClientProvider));
});

final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  return NewsRepository(ref.read(newsApiProvider));
});

// final newsProviders = StateNotifierProvider<NewsNotifier, List<Articles>>((ref) {
//   return NewsNotifier(ref: ref);
// });

final isLoadingNewsProvider = StateProvider<bool>((ref) {
  return true;
});
