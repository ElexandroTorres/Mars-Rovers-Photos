import 'package:flutter/material.dart';
import 'package:mars_rovers_photos/model/photo.dart';
import 'package:mars_rovers_photos/repositories/rover_photos_repository.dart';
import 'package:mars_rovers_photos/screens/photo_details_screen.dart';
import 'package:http/http.dart' as http;
import 'package:mars_rovers_photos/viewmodel/rover_photos_viewmodel.dart';
import 'package:mars_rovers_photos/widgets/photo_item.dart';
import 'package:provider/provider.dart';

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
    Provider.of<RoverPhotosViewModel>(context, listen: false)
        .fetchLatestPhotos(widget.roverName);
    //_getPhotos();
    selectBySolController = TextEditingController();
  }

  @override
  void dispose() {
    selectBySolController.dispose();
    super.dispose();
  }

  List<String> _dropDownItens = ['latest_photos', 'photos_by_sol'];
  String? _selectedItem = 'latest_photos';
  /*
  void dropDownCallBack(String? selectedItem) {
    if (selectedValue is String) {
      setState(() {
        _dropValue = selectedValue;
      });
    }
  }
  */

  @override
  Widget build(BuildContext context) {
    var roverPhotosViewModel = Provider.of<RoverPhotosViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.5,
                  style: BorderStyle.solid,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Opções de busca',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Tipo de busca'),
                        DropdownButton(
                          value: _selectedItem,
                          items: _dropDownItens
                              .map(
                                (item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                ),
                              )
                              .toList(),
                          onChanged: (item) => setState(() {
                            _selectedItem = item.toString();
                          }),
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
            ),
            Expanded(
              child: GridView.builder(
                itemCount: roverPhotosViewModel.roverPhotos.length,
                itemBuilder: (context, index) {
                  return PhotoItem(
                    imageUrl: roverPhotosViewModel.roverPhotos[index].imgSrc,
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
