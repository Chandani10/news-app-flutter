

import 'package:freezed_annotation/freezed_annotation.dart';
import 'news_model.dart';

part 'news_list_state.freezed.dart';

@freezed
class NewsList with _$NewsList {

  const factory NewsList({
    required List<News> values,
    required String countryCode
  }) = _NewsList;

  const NewsList._();

  operator [](final int index) => values[index];

  int get length => values.length;

}
