
import 'package:freezed_annotation/freezed_annotation.dart';
part 'news_model.freezed.dart';

@freezed
class News with _$News{

  const factory News({
    required Source source,
    required String author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required DateTime publishedAt,
    required String content,
  }) = _News;

  const News._();

  factory News.fromJson(Map<String, dynamic> json) => News(
    source: Source.fromJson(json["source"]),
    author: json["author"] ?? '',
    title: json["title"] ?? '',
    description: json["description"] ?? 'No description available',
    url: json["url"] ?? '',
    urlToImage: json["urlToImage"] ?? 'https://c.ndtvimg.com/2023-01/ve0tcrdo_us-newspaper-generic-media-generic-getty-_625x300_22_January_23.jpg',
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"] ?? '',
  );

}

class Source {
  Source({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"] ?? '',
    name: json["name"],
  );
}
