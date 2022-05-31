import 'package:flutter/material.dart';
import 'package:mars_rovers_photos/model/photo.dart';
import 'package:mars_rovers_photos/repositories/rover_photos_repository.dart';
import 'package:mars_rovers_photos/screens/photo_details_screen.dart';
import 'package:http/http.dart' as http;

class RoverPhotosScreen extends StatefulWidget {
  final String roverName;

  const RoverPhotosScreen({Key? key, required this.roverName})
      : super(key: key);

  @override
  State<RoverPhotosScreen> createState() => _RoverPhotosScreenState();
}

class _RoverPhotosScreenState extends State<RoverPhotosScreen> {
  List<Photo> photos = [];
  RoverPhotosRepository roverPhotosRepository =
      RoverPhotosRepository(client: http.Client());
  String result = 'teste';

  _getPhotos() {
    roverPhotosRepository.getLatestPhotos(widget.roverName).then((result) {
      setState(() {
        photos = result;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: photos.length > 0
          ? GridView.builder(
              itemCount: photos.length,
              itemBuilder: (context, index) {
                return PhotoItem(
                  imageUrl: photos[index].imgSrc,
                );
              },
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            )
          : Text('${result}'),
    );
  }
}

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

/**
 * 
 * Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                RoverPhotosScreen(roverName: roverManifest.name!),
          ),
 */

//