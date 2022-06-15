import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mars_rovers_photos/model/photo.dart';
import 'package:mars_rovers_photos/repositories/rover_photos_repository.dart';

enum LoadingStatus { completed, searching, empty, fail }

class RoverPhotosViewModel extends ChangeNotifier {
  List<Photo> roverPhotos = [];
  LoadingStatus loadingStatus = LoadingStatus.empty;

  Future<void> fetchLatestPhotos(String roverName) async {
    try {
      loadingStatus = LoadingStatus.searching;
      notifyListeners();
      roverPhotos = await RoverPhotosRepository(client: http.Client())
          .getLatestPhotos(roverName);

      if (roverPhotos.isEmpty) {
        loadingStatus = LoadingStatus.empty;
      } else {
        loadingStatus = LoadingStatus.completed;
      }
      notifyListeners();
    } catch (e) {
      loadingStatus = LoadingStatus.fail;
      notifyListeners();
    }
  }

  Future<void> fetchPhotosBySol(String roverName, int sol) async {
    try {
      roverPhotos = await RoverPhotosRepository(client: http.Client())
          .getPhotosBySol(roverName, sol);
    } catch (e) {}
  }
  /*
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
  */
}
