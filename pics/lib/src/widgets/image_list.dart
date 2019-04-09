import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.8,
      children: List.generate(images.length, (int index) {
        return Center(child: buildImageCard(images[index]));
      })
    );
  }
  
  Widget buildImageCard(ImageModel image) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
      margin: EdgeInsets.all(8),
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            buildImage(image),
            Text(image.title, textAlign: TextAlign.center)
          ]
        )
      )
    );
  }

  Widget buildImage(ImageModel image) {
    return Card(
      shape: CircleBorder(side: BorderSide(style: BorderStyle.none)),
      margin: EdgeInsets.all(8),
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      child: Image.network(image.url)
    );
  }
}

// class ImageListState extends State<ImageList> {
//   List<ImageCard> images = new List<ImageCard>();

//   ImageCard add(ImageModel imageModel) {
//     var card = ImageCard(imageModel);
//     setState(() {
//       images.add(card);
//     });
//     return card;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return null;
//   }
// }

// class ImageCard extends StatelessWidget {
//   int id;
//   String url;
//   String title;

//   ImageCard(this.id, this.url, this.title);
//   ImageCard.fromModel(ImageModel imageModel) {
//     id = imageModel.id;
//     url = imageModel.url;
//     title = imageModel.title;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return ImageCard(context.)
//   }
// }

