import 'package:flutter/material.dart';
import 'package:mars_rovers_photos/screens/select_rover_screen.dart';
import 'package:mars_rovers_photos/screens/splash_screen.dart';
import 'package:mars_rovers_photos/viewmodel/rover_photos_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MarsRoversPhotos());
}

class MarsRoversPhotos extends StatelessWidget {
  const MarsRoversPhotos({Key? key}) : super(key: key);

  /**
   * MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => RoverPhotosViewModel(),
                ),
              ],
              child: const SelectRoverScreen(),
            ),
   */

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RoverPhotosViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mars Rovers Photos',
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/home': (context) => const SelectRoverScreen(),
        },
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        //home: const SelectRoverPage(),
      ),
    );
  }
}
