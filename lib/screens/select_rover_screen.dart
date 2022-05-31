import 'package:flutter/material.dart';
import 'package:mars_rovers_photos/model/rover_manifest.dart';
import 'package:mars_rovers_photos/screens/rover_photos_screen.dart';

class SelectRoverScreen extends StatelessWidget {
  const SelectRoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, RoverManifest> roversManifests = ModalRoute.of(context)!
        .settings
        .arguments as Map<String, RoverManifest>;

    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select a rover',
              style: TextStyle(fontSize: 32, fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                ItemRover(
                    color: Colors.amber,
                    roverManifest: roversManifests['curiosity']!),
                ItemRover(
                    color: Colors.black,
                    roverManifest: roversManifests['spirit']!),
              ],
            ),
            Row(
              children: [
                ItemRover(
                  color: Colors.yellow,
                  roverManifest: roversManifests['opportunity']!,
                ),
                ItemRover(
                  color: Colors.red,
                  roverManifest: roversManifests['perseverance']!,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
                RoverPhotosScreen(roverName: roverManifest.name!),
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
            Text(roverManifest.status!)
          ],
        ),
      ),
    );
  }
}
