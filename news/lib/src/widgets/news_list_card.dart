import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/stories_provider.dart';
import '../widgets/loading_container.dart';

class NewsListCard extends StatelessWidget {
  final int itemId;

  NewsListCard({ this.itemId });

  Widget build(context) {
    final bloc = StoriesProvider.of(context);

    return StreamBuilder(
      stream: bloc.items,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot) {
        if (!snapshot.hasData) {
          return LoadingContainer();
        }

        return FutureBuilder(
          future: snapshot.data[itemId],
          builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
            if (!itemSnapshot.hasData) {
              return LoadingContainer();
            }

            final ItemModel item = itemSnapshot.data;
            return buildCard(context, item);
          }
        );
      }
    );
  }

  Widget buildCard(BuildContext context, ItemModel item) {
    return Column(
      children: <Widget>[
        Container(height: 4),
        Card(
          elevation: 3,
          child: ListTile(
            onTap: () {
              print('${item.id}');
              Navigator.pushNamed(context, '/${item.id}');
            },
            title: Text(item.title),
            subtitle: Text('${item.score} votes'),
            trailing: Column(
              children: <Widget>[
                Icon(Icons.comment),
                Text('${item.descendants}')
              ],
            ),
          )
        ),
        Container(height: 4)
      ]
    );
  }

}

