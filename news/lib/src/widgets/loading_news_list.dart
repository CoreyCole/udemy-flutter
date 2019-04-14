import 'package:flutter/material.dart';
import 'loading_container.dart';

class LoadingNewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, _) {
        return LoadingContainer();
      }
    );
  }
}

