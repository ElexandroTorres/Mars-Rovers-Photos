import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoDetailsScreen extends StatelessWidget {
  final String imageUrl;

  const PhotoDetailsScreen({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: PhotoView(imageProvider: NetworkImage(imageUrl)),
    );
  }
}
