//
//
// import 'dart:convert';
// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:news_app_flutter/constant/export.dart';
// import 'package:news_app_flutter/main.dart';
// import 'package:news_app_flutter/presentation/providers/news_state_notifier.dart';
//
// class NewsRepository {
//   final ApiRepository apiRepository;
//
//   NewsRepository(this.apiRepository);
//
//   Future <List<Articles>> fetchNews() async {
//     try {
//       final res = await apiRepository.newsListApiCall();
//       print("============${jsonEncode(res)}");
//       final newsResponseModel=
// =jsonEncode(res) ;
//
//       (res as List).map((e) => Articles.fromJson(e)).toList();
//       return newsResponseModel;
//     } on DioError catch (e) {
//       final errorMessage = DioExceptions.fromDioError(e);
//       log(errorMessage.toString());
//       rethrow;
//     }
//   }
// }
//
//
//
// final newsApiProvider = Provider<ApiRepository>((ref) {
//   return ApiRepository(ref.read(dioClientProvider));
// });
//
// final newsRepositoryProvider = Provider<NewsRepository>((ref) {
//   return NewsRepository(ref.read(newsApiProvider));
// });
//
// final newsProvider = StateNotifierProvider<NewsNotifier, List<Articles>>((ref) {
//   return NewsNotifier(ref: ref);
// });
//
// final isLoadingNewsProvider = StateProvider<bool>((ref) {
//   return true;
// });
