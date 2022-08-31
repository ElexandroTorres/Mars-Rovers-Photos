import 'package:flutter/material.dart';
import 'package:mars_rovers_photos/model/photo.dart';
import 'package:mars_rovers_photos/model/rover_manifest.dart';
import 'package:mars_rovers_photos/repositories/rover_photos_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mars_rovers_photos/viewmodel/rover_photos_viewmodel.dart';
import 'package:mars_rovers_photos/widgets/PhotosGrid.dart';
import 'package:provider/provider.dart';

class RoverPhotosScreen extends StatefulWidget {
  final RoverManifest roverManifest;

  const RoverPhotosScreen({Key? key, required this.roverManifest})
      : super(key: key);

  @override
  State<RoverPhotosScreen> createState() => _RoverPhotosScreenState();
}

class _RoverPhotosScreenState extends State<RoverPhotosScreen> {
  List<Photo> photos = [];
  RoverPhotosRepository roverPhotosRepository =
      RoverPhotosRepository(client: http.Client());

  late final TextEditingController selectBySolController;

  @override
  void initState() {
    super.initState();
    Provider.of<RoverPhotosViewModel>(context, listen: false)
        .fetchLatestPhotos(widget.roverManifest.name!);
    selectBySolController = TextEditingController();
  }

  @override
  void dispose() {
    selectBySolController.dispose();
    super.dispose();
  }

  final List<String> _dropDownItens = [
    'latest_photos',
    'first_photos',
    'photos_by_sol'
  ];

  String? _selectedItem = 'latest_photos';
  int _currentSolValue = 1;

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
                      'Search Options',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Search type'),
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
                          onChanged: (item) {
                            setState(() {
                              _selectedItem = item.toString();
                            });
                            if (_selectedItem == 'latest_photos') {
                              roverPhotosViewModel.fetchLatestPhotos(
                                  widget.roverManifest.name!);
                            }
                          },
                        ),
                      ],
                    ),
                    _selectedItem == 'photos_by_sol'
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.wb_sunny_outlined),
                              TextButton(
                                onPressed: () {
                                  if (_currentSolValue <
                                      widget.roverManifest.maxSol!) {
                                    setState(() => _currentSolValue++);
                                  }
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: selectBySolController
                                    ..text = _currentSolValue.toString(),
                                  keyboardType: TextInputType.numberWithOptions(
                                    signed: false,
                                    decimal: false,
                                  ),
                                  decoration: InputDecoration(
                                    focusColor: Colors.orange,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      if (int.parse(value) < 0) {
                                        _currentSolValue = 0;
                                      } else if (int.parse(value) >
                                          widget.roverManifest.maxSol!) {
                                        _currentSolValue =
                                            widget.roverManifest.maxSol!;
                                      } else {
                                        _currentSolValue = int.parse(value);
                                      }
                                    });
                                  },
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (_currentSolValue > 0) {
                                    setState(() => _currentSolValue--);
                                  }
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  roverPhotosViewModel.fetchPhotosBySol(
                                      widget.roverManifest.name!,
                                      int.parse(selectBySolController.text));
                                },
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
            Expanded(
              child: PhotosGrid(
                photos: roverPhotosViewModel.roverPhotos,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
