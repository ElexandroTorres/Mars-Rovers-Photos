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

  late final TextEditingController selectBySolController;

  _getPhotos() {
    roverPhotosRepository.getLatestPhotos(widget.roverName).then((result) {
      setState(() {
        photos = result;
      });
    });
  }

  _getPhotosBySol({required int sol}) {
    roverPhotosRepository.getPhotosBySol(widget.roverName, sol).then((result) {
      setState(() {
        photos = result;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getPhotos();
    selectBySolController = TextEditingController();
  }

  @override
  void dispose() {
    selectBySolController.dispose();
    super.dispose();
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
                    color: Colors.grey,
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
                                    _getPhotosBySol(sol: 2);
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
                            SizedBox(width: 16),
                            Expanded(
                              child: TextField(
                                controller: selectBySolController,
                                keyboardType: TextInputType.numberWithOptions(
                                  signed: false,
                                  decimal: false,
                                ),
                                decoration: InputDecoration(
                                  focusColor: Colors.orange,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _getPhotosBySol(
                                    sol: int.parse(selectBySolController.text));
                              },
                              child: Icon(Icons.search),
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