import 'package:flutter/material.dart';
import '../blocs/stories_provider.dart';

class NewsDetail extends StatelessWidget {
  final int itemId;

  NewsDetail({ this.itemId });

  Widget build(context) {
    final bloc = StoriesProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Story')
      ),
      body: Text('Detail screen $itemId')
    );
  }
}

