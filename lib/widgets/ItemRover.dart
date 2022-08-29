import 'dart:ui';

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
        width: (size.width / 2),
        height: (size.height / 3.5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          margin: EdgeInsets.all(4),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                "assets/images/Perseverance.jpg",
                fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.wb_sunny_outlined, color: Colors.white),
                        SizedBox(width: 2),
                        Text(
                          roverManifest.maxSol.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.launch_outlined),
                        Text(
                          roverManifest.launchDate.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.camera_alt_outlined),
                        SizedBox(width: 2),
                        Text(
                          roverManifest.totalPhotos.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Text(roverManifest.name!,
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Status: ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          roverManifest.status!.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
