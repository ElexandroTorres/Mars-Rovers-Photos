import 'package:flutter/material.dart';
import 'package:mars_rovers_photos/model/photo.dart';
import 'package:mars_rovers_photos/widgets/photo_item.dart';

class PhotosGrid extends StatelessWidget {
  const PhotosGrid({Key? key, required this.photos}) : super(key: key);

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return PhotoItem(
          imageUrl: photos[index].imgSrc,
        );
      },
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}
