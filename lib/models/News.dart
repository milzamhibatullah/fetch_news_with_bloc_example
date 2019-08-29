class News{
   final List results;
   News({this.results});

   factory News.fromJson(Map<String, dynamic> json){
     print(json['articles']);
     return News(
       results: json['articles']
     );
   }
}