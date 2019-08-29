import '../models/News.dart';
import '../provider/NewsProvider.dart';

class Repository{
  final newsProvider = NewsProvider();
  Future<News> fetchNews()=>newsProvider.fetchNews();
}