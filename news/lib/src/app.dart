import 'package:flutter/material.dart';
import 'screens/news_list.dart';
import 'screens/news_detail.dart';
import 'blocs/stories_provider.dart';

class App extends StatelessWidget {
  Widget build(context) {

    return StoriesProvider(
      child: MaterialApp(
        title: 'News',
        onGenerateRoute: routes
      )
    );
  }

  Route routes(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        final bloc = StoriesProvider.of(context);

        print(settings.name);
        switch(settings.name) {
          case '/': {
            bloc.fetchTopIds(); 
            return NewsList();
          }
          default: {
            int itemId = int.parse(settings.name.replaceFirst('/', ''));
            return NewsDetail(itemId: itemId);
          }
        }
      }
    );
  }
}
