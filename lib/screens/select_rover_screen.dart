import 'package:flutter/material.dart';
import 'package:mars_rovers_photos/model/rover_manifest.dart';
import 'package:mars_rovers_photos/widgets/ItemRover.dart';

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
                    color: Colors.brown,
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
