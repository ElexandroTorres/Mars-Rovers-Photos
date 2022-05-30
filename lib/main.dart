import 'package:flutter/material.dart';

void main() {
  runApp(const MarsRoversPhotos());
}

class MarsRoversPhotos extends StatelessWidget {
  const MarsRoversPhotos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mars Rovers Photos',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => SelectRoverScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      //home: const SelectRoverPage(),
    );
  }
}
