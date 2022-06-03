import 'package:flutter/material.dart';
import 'package:mars_rovers_photos/screens/photo_details_screen.dart';

class PhotoItem extends StatelessWidget {
  final String? imageUrl;
  const PhotoItem({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return Image.network(imageUrl!);
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PhotoDetailsScreen(
              imageUrl: imageUrl!,
            ),
          ),
        );
      },
      child: Container(
        width: size.width / 2,
        height: size.width / 2,
        child: FittedBox(
          child: Image.network(imageUrl!),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
