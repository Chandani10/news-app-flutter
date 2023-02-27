
import 'package:http/http.dart' as http;
import 'package:news_app_flutter/constant/export.dart';

class ApiRepository {
  static const String _baseUrl =
      'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=fd32f8ae57794159b0719d981ba2988a';

  static Future<List<Articles>> fetchNews() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final  result=jsonDecode(response.body);
      return List<Articles>.from(result['articles'].map((e) => Articles.fromJson(e)));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

class ApiRepositoryApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  ApiRepositoryApi(this._dioClient);

  Future fetchNewsApiRequest() async {
    try {
      final res = await _dioClient.get(Endpoints.newsListEndPoint);
      return res.data;
    } catch (e) {
      rethrow;
    }
  }
}