import 'package:flutter/material.dart';
import 'package:http/http.dart' show get, Response; // dumps everything except get method and Response type
import 'dart:convert';
import 'models/image_model.dart';
import 'widgets/image_list.dart';

// if it was not a stateful widget, build method would be called on each render
// calling MaterialApp, Scaffold, etc over and over again for each button press
// not only is this inefficient, it would also reset the counter instance variable to 0 each time
class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int imageId = 1;
  List<ImageModel> images = [];

  void displayImage() async {
    Response res = await get('https://jsonplaceholder.typicode.com/photos/$imageId');
    var imageModel = ImageModel.fromJson(json.decode(res.body));
    images.add(imageModel);
    setState(() {
      imageId++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('GridView of Images')),
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          onPressed: displayImage,
          child: Icon(Icons.add),
        ),
      )
    );
  }
}
