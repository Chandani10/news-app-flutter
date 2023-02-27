
import 'dart:convert';

import 'package:http/http.dart' as http;

class NewsApi {
  static const String _baseUrl =
      'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=fd32f8ae57794159b0719d981ba2988a';

  static Future<Map<String, dynamic>> fetchNews() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      return parsed;
    } else {
      throw Exception('Failed to fetch news');
    }
  }
}