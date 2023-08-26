import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/news_entity/news_model/news_list_state.dart';
import '../../domain/news_entity/news_model/news_model.dart';
import '../datasource/newsfeed_impl.dart';

final newsFeedRepoProvider = Provider<NewsFeedRepo>((ref) => NewsFeedRepo(ref));

class NewsFeedRepo {


  final Ref ref;

  NewsFeedRepo(this.ref);

  Future<NewsList> getNews(String countryCode ,{String searchKey = '' , String sortBy = ''})  async{
    List<News> newsList = [];
    Map<String,dynamic> queryParams = {
      'country' : countryCode,
      'category' : 'business',
      'q': searchKey,
      'apiKey' : '47ae1fd6b8174621bcd8d7d2d124b85d'
    };

    final response = await ref.read(newsFeedApiProvider).getNews('top-headlines',countryCode,queryParams);

    List<dynamic> responseList = response.data['articles'];

    for (var news in responseList) {
      if(sortBy != ''){
        if(sortBy == 'publishedAt') {
          newsList.sort((a, b) => a.publishedAt.compareTo(b.publishedAt));
        }
        else{
          newsList.sort((a, b) => a.source.name.compareTo(b.source.name));
        }
      }
      newsList.add(News.fromJson(news));
    }
    return NewsList(values: newsList,countryCode: countryCode);
  }



}