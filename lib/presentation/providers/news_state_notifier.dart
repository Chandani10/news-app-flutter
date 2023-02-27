// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:news_app_flutter/domain/models/news_response_model.dart';
// import 'package:news_app_flutter/presentation/providers/news_provider.dart';
//
//
// class NewsNotifier extends StateNotifier<List<Articles>> {
//   // Fetching all news whenever anyone starts listening.
//   // Passing Ref, in order to access other providers inside this.
//   NewsNotifier({required this.ref}) : super([]) {
//     fetchNewsStateNotifier(ref: ref);
//   }
//   final Ref ref;
//
//   Future fetchNewsStateNotifier({required Ref ref}) async {
//     await ref.read(newsRepositoryProvider).fetchNews().then((value) {
//       // Setting current `state` to the fetched list of news.
//
//       state = value;
//       // Setting isLoading to `false`.
//       ref.read(isLoadingNewsProvider.notifier).state = false;
//     });
//   }
//
// }
//
