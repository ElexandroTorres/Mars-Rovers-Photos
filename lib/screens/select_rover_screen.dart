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
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.orange,
                Colors.orangeAccent,
                Colors.deepOrange,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ItemRover(
                      color: Colors.amber,
                      roverManifest: roversManifests['curiosity']!,
                      image: "assets/images/curiosity.jpg"),
                  ItemRover(
                      color: Colors.brown,
                      roverManifest: roversManifests['spirit']!,
                      image: "assets/images/spirit.jpeg"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ItemRover(
                    color: Colors.yellow,
                    roverManifest: roversManifests['opportunity']!,
                    image: "assets/images/opportunity.jpeg",
                  ),
                  ItemRover(
                    color: Colors.red,
                    roverManifest: roversManifests['perseverance']!,
                    image: "assets/images/Perseverance.jpg",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
