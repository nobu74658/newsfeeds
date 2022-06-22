import '../data/category_info.dart';
import '../data/search_type.dart';

class NewsRepository {

  Future<void> getNews({ required SearchType searchType, String? keyword, Category? category}) async{
  //  TODO
    print("[repository] searchType: $searchType / keyword: $keyword / category: ${category?.nameJp}");
  }
}