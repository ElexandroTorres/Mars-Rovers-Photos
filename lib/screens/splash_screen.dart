import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mars_rovers_photos/model/rover_manifest.dart';
import 'package:mars_rovers_photos/repositories/rover_manifest_repository.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getRoverDataFromMars();
  }

  void getRoverDataFromMars() async {
    RoverManifestRepository roverManifestRepository =
        RoverManifestRepository(client: http.Client());

    RoverManifest curiosityManifest =
        await roverManifestRepository.getRoverManifest('Curiosity');
    RoverManifest spiritManifest =
        await roverManifestRepository.getRoverManifest('Spirit');
    RoverManifest opportunityManifest =
        await roverManifestRepository.getRoverManifest('Opportunity');
    RoverManifest perseveranceManifest =
        await roverManifestRepository.getRoverManifest('Perseverance');

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'curiosity': curiosityManifest,
      'spirit': spiritManifest,
      'opportunity': opportunityManifest,
      'perseverance': perseveranceManifest
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SpinKitCubeGrid(
                  color: Colors.orange,
                  size: screenSize.width / 4,
                ),
                Text(
                  'Baixando informações de marte...',
                  style: TextStyle(color: Colors.orange),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
