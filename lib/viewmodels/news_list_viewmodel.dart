import 'package:flutter/material.dart';
import 'package:newsfeeds/repository/news_repository.dart';
import '../data/category_info.dart';
import '../data/search_type.dart';

class NewsListViewModel extends ChangeNotifier {

  final NewsRepository _repository = NewsRepository();

  SearchType _searchType = SearchType.CATEGORY;
  SearchType get searchType => _searchType;

  Category _category = categories[0];
  Category get category => _category;

  String _keyword = "";
  String get keyword => _keyword;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getNews(
      {required SearchType searchType, String? keyword, Category? category}) async{
    _searchType = searchType;
    _keyword = keyword ?? _keyword;
    _category = category ?? _category;

    _isLoading = true;
    notifyListeners();

    print("[viewModel] searchType: $searchType / keyword: $keyword / category: ${category?.nameJp}");

    //  TODO
    await _repository.getNews(searchType: _searchType, keyword: _keyword, category: _category);

    _isLoading = false;
    notifyListeners();

  }
}