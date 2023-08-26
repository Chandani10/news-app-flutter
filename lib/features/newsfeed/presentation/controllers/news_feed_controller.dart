import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_flutter/features/newsfeed/domain/news_entity/news_model/news_list_state.dart';
import 'package:news_app_flutter/features/newsfeed/domain/news_entity/news_model/search_state.dart';
import 'package:news_app_flutter/service/app_service.dart';


final newsFeedController = StateNotifierProvider<NewsFeedController, AsyncValue<NewsList>>((ref) {
  return NewsFeedController(ref);});


class NewsFeedController extends StateNotifier<AsyncValue<NewsList>> {
  final Ref ref;
  String searchText = "";
  String sortText = "";

  NewsFeedController(this.ref) : super(const AsyncValue.loading()){
      getAllNews();
  }


   getAllNews({String searchKey = '',String sortBy = ''}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(applicationService).getNewsFeed(searchKey: searchKey,sortBy:sortBy ));
  }

  void search(String query) {
    searchText = query;
    getAllNews(searchKey: searchText);
  }

  void sortByPublishAt(String query) {
    sortText = query;
    getAllNews(sortBy: sortText);
  }


}


final searchStateController = StateNotifierProvider<SearchStateController, SearchState>((ref) => SearchStateController(ref));

class SearchStateController extends StateNotifier<SearchState> {
  final Ref ref;
  SearchStateController(this.ref) : super(const SearchState());



  setSearchField(bool isSearchVisible){
    state = state.copyWith(isSearchVisible: isSearchVisible);
  }



}

