import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../widgets/loading_container.dart';

class Comment extends StatelessWidget {
  final int itemId;
  final int depth;
  final Map<int, Future<ItemModel>> itemMap;

  Comment({ this.itemId, this.depth, this.itemMap });

  Widget build(context) {
    return FutureBuilder(
      future: itemMap[itemId],
      builder: (context, AsyncSnapshot<ItemModel> itemSnapshot) {
        if (!itemSnapshot.hasData) {
          return LoadingContainer();
        }

        ItemModel item = itemSnapshot.data;

        final children = List<Widget>();
        children.add(
          ListTile(
            title: buildText(item),
            subtitle: Text(item.by == '' ? 'Deleted' : item.by),
            contentPadding: EdgeInsets.only(
              right: 16,
              left: 16.0 * depth
            ),
          )
        );
        children.add(Divider());
        item.kids.forEach((kidId) {
          final comment = Comment(itemId: kidId, depth: depth + 1, itemMap: itemMap);
          children.add(comment);
        });

        return Column(
          children: children
        );
      }
    );
  }

  Widget buildText(ItemModel item) {
    final text = item.text
      .replaceAll('&#27;', '\'')
      .replaceAll('&#x27;', '\'')
      .replaceAll('<p>', '\n\n')
      .replaceAll('</p>', '')
      .replaceAll('<i>', '')
      .replaceAll('</i>', '')
      .replaceAll('&gt;', '>');
    return Text(text);
  }
}