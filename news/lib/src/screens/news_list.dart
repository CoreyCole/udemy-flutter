import 'package:flutter/material.dart';
import '../blocs/stories_provider.dart';
import '../widgets/news_list_card.dart';
import '../widgets/loading_news_list.dart';
import '../widgets/refresh.dart';

class NewsList extends StatelessWidget {
  Widget build(context) {
    final bloc = StoriesProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Top News')
      ),
      body: buildList(bloc)
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (context, AsyncSnapshot<List<int>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: LoadingNewsList());
        }

        return Refresh(
          child: ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, int index) {
              final int itemId = snapshot.data[index];
              bloc.fetchItem(itemId);
              return NewsListCard(itemId: itemId);
            }
          )
        );
      }
    );
  }
}

