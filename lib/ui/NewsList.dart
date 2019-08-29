import 'package:flutter/material.dart';
import '../models/News.dart';
import '../blocs/NewsBloc.dart';

class NewsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewsListState();
  }
}

class NewsListState extends State<NewsList> {
  @override
  void initState() {
    bloc.fetchAllNews();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body:StreamBuilder(
          stream: bloc.allNews,
          builder: (context, AsyncSnapshot<News> snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          },
        )
      ),
    );
  }

  Widget buildList(AsyncSnapshot<News> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.results.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(snapshot.data.results[index]['title']),
          );
        });
  }
}
