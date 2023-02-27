import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_flutter/domain/models/news_response_model.dart';
import 'package:news_app_flutter/presentation/providers/news_provider.dart';


class NewsNotifier extends StateNotifier<AsyncValue<List<Articles>>> {
  // Fetching all news whenever  starts listening.
  // Passing Ref, in order to access other providers inside this.
  NewsNotifier({required this.ref}) : super([] as AsyncValue<List<Articles>>) {
    fetchNewsStateNotifier(ref: ref);
  }
  final Ref ref;

  Future fetchNewsStateNotifier({required Ref ref}) async {
    state=AsyncLoading();
    await ref.read(newsRepositoryProvider).fetchNews().then((value) {
      // Setting current `state` to the fetched list of news.

      state = value as AsyncValue<List<Articles>>;
      // Setting isLoading to `false`.
      ref.read(isLoadingNewsProvider.notifier).state = false;
    });
  }
  //use try catch

}

