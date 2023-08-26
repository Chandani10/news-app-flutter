

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_flutter/features/newsfeed/data/news_feed_repo/news_feed_repo.dart';
import 'package:news_app_flutter/features/newsfeed/domain/news_entity/news_model/news_list_state.dart';


final applicationService = Provider<ApplicationService>((ref) => ApplicationService(ref));

class ApplicationService {

  final Ref ref;

  ApplicationService(this.ref);

  Future<NewsList> getNewsFeed({String searchKey = '',String sortBy = ''}) async{
    final newsList = await ref.read(newsFeedRepoProvider).getNews('in' ,searchKey:searchKey,sortBy: sortBy ); //fetching news_model of that countryCode
    return newsList;
  }
}

