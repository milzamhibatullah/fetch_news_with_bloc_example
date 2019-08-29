import '../repository/Repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/News.dart';

class NewsBloc{
  final _repository = Repository();
  final _newsFetcher = PublishSubject<News>();

  Observable<News> get allNews => _newsFetcher.stream;

  fetchAllNews() async{
    News news = await _repository.fetchNews();
    _newsFetcher.sink.add(news);
  }

  dispose(){
    _newsFetcher.close();
  }
}
final bloc = NewsBloc();