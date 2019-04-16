import 'package:flutter/material.dart';
import '../blocs/comments_provider.dart';
import '../models/item_model.dart';
import '../widgets/comment.dart';

class NewsDetail extends StatelessWidget {
  final int itemId;

  NewsDetail({ this.itemId });

  Widget build(context) {
    final commentsProvider = CommentsProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Story')
      ),
      body: buildBody(commentsProvider)
    );
  }

  Widget buildBody(CommentsBloc bloc) {
    return StreamBuilder(
      stream: bloc.itemWithComments,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> itemMapSnapshot) {
        if (!itemMapSnapshot.hasData) {
          return Text('loading . . .');
        }

        final itemFuture = itemMapSnapshot.data[itemId];

        return FutureBuilder(
          future: itemFuture,
          builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return Text('loading . . .');
            }

            return buildList(itemSnapshot.data, itemMapSnapshot.data);
          }
        );
      }
    );
  }

  Widget buildList(ItemModel item, Map<int, Future<ItemModel>> itemMap) {
    final children = List<Widget>();
    children.add(buildTitle(item));
    final commentsList = item.kids.map((kidId) {
      return Comment(itemId: kidId, depth: 1, itemMap: itemMap);
    });
    children.addAll(commentsList);

    return ListView(
      children: children,
    );
  }

  Widget buildTitle(ItemModel item) {
    return Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.topCenter,
      child: Text(
        item.title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        )
      )
    );
  }
}

