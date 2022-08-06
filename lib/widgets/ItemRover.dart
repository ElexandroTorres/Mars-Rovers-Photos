import 'package:flutter/material.dart';
import 'package:mars_rovers_photos/model/rover_manifest.dart';
import 'package:mars_rovers_photos/screens/rover_photos_screen.dart';

class ItemRover extends StatelessWidget {
  final Color color;
  final RoverManifest roverManifest;

  const ItemRover({
    Key? key,
    required this.color,
    required this.roverManifest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                RoverPhotosScreen(roverManifest: roverManifest),
          ),
        );
      },
      child: Container(
        width: size.width / 2,
        height: size.width / 2,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(roverManifest.name!),
            Text(roverManifest.maxSol.toString()),
            Text(roverManifest.launchDate.toString()),
            Text(roverManifest.status!),
            Text('${roverManifest.totalPhotos} photos'),
            Text(roverManifest.maxSol.toString()),
          ],
        ),
      ),
    );
  }
}
