import 'package:flutter/material.dart';
import 'screens/news_list.dart';
import 'screens/news_detail.dart';
import 'blocs/stories_provider.dart';
import 'blocs/comments_provider.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return StoriesProvider(
      child: CommentsProvider(
        child: MaterialApp(
          title: 'News',
          onGenerateRoute: routes
        )
      )
    );
  }

  Route routes(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        final commentsBloc = CommentsProvider.of(context);
        final stpriesBloc = StoriesProvider.of(context);

        switch(settings.name) {
          case '/': {
            stpriesBloc.fetchTopIds(); 
            return NewsList();
          }
          default: {
            int itemId = int.parse(settings.name.replaceFirst('/', ''));
            commentsBloc.fetchItemWithComments(itemId);
            return NewsDetail(itemId: itemId);
          }
        }
      }
    );
  }
}
