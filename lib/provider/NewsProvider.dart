import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc_apps_news/models/News.dart';

class NewsProvider {

  String _baseUrl = 'https://newsapi.org/v2/';
  var client = new http.Client();
  final apiKey = 'd641f36aa8b7450cb3ebe7fbc1e69917';

  Future<News> fetchNews() async{
    print('entered');
    final response = await client.get(_baseUrl+'top-headlines?country=id&apiKey='+apiKey);
//    print(json.decode(response.body));
//    print(response.toString());
    if(response.statusCode==200){
      return News.fromJson(json.decode(response.body));
    }else{
      print('falied to load');
    }
  }

}