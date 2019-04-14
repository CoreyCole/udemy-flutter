import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  Widget build(context) {
    return Column(
      children: <Widget>[
        Container(height: 4),
        Card(
          elevation: 3,
          child: ListTile(
            title: _buildGreyBox(),
            subtitle: _buildGreyBox(),
          )
        ),
        Container(height: 4)
      ],
    );
  }

  Widget _buildGreyBox() {
    return Container(
      color: Colors.grey[300],
      height: 24,
      width: 150,
      margin: EdgeInsets.only(top: 5, bottom: 5)
    );
  }
}

