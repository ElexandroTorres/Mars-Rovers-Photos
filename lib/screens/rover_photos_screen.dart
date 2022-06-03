import 'package:flutter/material.dart';
import 'package:mars_rovers_photos/model/photo.dart';
import 'package:mars_rovers_photos/repositories/rover_photos_repository.dart';
import 'package:mars_rovers_photos/screens/photo_details_screen.dart';
import 'package:http/http.dart' as http;
import 'package:mars_rovers_photos/widgets/photo_item.dart';

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
  //String result = 'teste';

  _getPhotos() {
    roverPhotosRepository.getLatestPhotos(widget.roverName).then((result) {
      setState(() {
        photos = result;
      });
    });
  }

  _getPhotosBySol() {
    roverPhotosRepository.getPhotosBySol(widget.roverName, 71).then((result) {
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

  String _dropValue = 'latest_photos';

  void dropDownCallBack(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropValue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: photos.length > 0
          ? SafeArea(
              child: Column(
                children: [
                  Container(
                    color: Colors.red,
                    child: Column(
                      children: [
                        Text(
                          'Personalização de busca',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Tipo de busca'),
                            DropdownButton(
                              value: _dropValue,
                              items: [
                                DropdownMenuItem(
                                  child: Text('Ultimas fotos'),
                                  value: 'latest_photos',
                                  onTap: () {},
                                ),
                                DropdownMenuItem(
                                  child: Text('Fotos por Sol'),
                                  value: 'photos_by_sol',
                                  onTap: () {
                                    _getPhotosBySol();
                                  },
                                ),
                              ],
                              onChanged: dropDownCallBack,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Selecione o sol'),
                            Expanded(
                              child: TextField(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: photos.length,
                      itemBuilder: (context, index) {
                        return PhotoItem(
                          imageUrl: photos[index].imgSrc,
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                    ),
                  ),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
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