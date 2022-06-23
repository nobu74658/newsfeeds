import 'dart:convert';

import '../data/category_info.dart';
import '../data/search_type.dart';
import '../models/model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository {

  static const BASE_URL = "https://newsapi.org/v2/top-headlines?country=jp";
  static const API_KEY = "4938e6bc5ea440dda41cc70cfdbf3d96";

  Future<List<Article>> getNews({required SearchType searchType, String? keyword, Category? category}) async {
    List<Article> result = [];

    http.Response? response;

    switch (searchType) {
      case SearchType.HEAD_LINE:
        final requestUrl = Uri.parse(BASE_URL + "&apiKey=$API_KEY");
        response = await http.get(requestUrl);
        break;
      case SearchType.KEYWORD:
        final requestUrl = Uri.parse(BASE_URL + "&q=$keyword&apiKey=$API_KEY");
        response = await http.get(requestUrl);
        break;
      case SearchType.CATEGORY:
        final requestUrl = Uri.parse(BASE_URL + "&category=${category?.nameEn}&apiKey=$API_KEY");
        response = await http.get(requestUrl);
        break;
    }

    if (response.statusCode == 200){
      final responseBody = response.body;
      result = News.fromJson(jsonDecode(responseBody)).articles;
    } else {
      throw Exception("Failed to load news");
    }

    return result;
  }
}
