import 'dart:convert';
import 'package:mars_rovers_photos/model/photo.dart';
import 'package:mars_rovers_photos/repositories/interfaces/rover_photos_repository_interface.dart';
import 'package:mars_rovers_photos/repositories/mars_rover_photos_api_infos.dart';
import 'package:http/http.dart' as http;

class RoverPhotosRepository implements IRoverPhotosRepository {
  final http.Client client;

  RoverPhotosRepository({required this.client});

  @override
  Future<List<Photo>> getLatestPhotos(String roverName) async {
    final String url =
        'https://api.nasa.gov/mars-photos/api/v1/rovers/${roverName}/latest_photos?api_key=${apiKey}';

    List<Photo> roverPhotos;

    http.Response response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Iterable roverPhotosResult = jsonDecode(response.body)['latest_photos'];
      roverPhotos =
          roverPhotosResult.map((photo) => Photo.fromJson(photo)).toList();

      return roverPhotos;
    } else {
      throw Exception('${response.statusCode}');
    }
  }

  @override
  Future<List<Photo>> getPhotosByCamera(String roverName) {
    throw UnimplementedError();
  }

  @override
  Future<List<Photo>> getPhotosBySol(String roverName, int sol) async {
    final String url =
        'https://api.nasa.gov/mars-photos/api/v1/rovers/${roverName}/photos?api_key=${apiKey}&sol=${sol}';

    List<Photo> roverPhotos;

    http.Response response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Iterable roverPhotosResult = jsonDecode(response.body)['photos'];
      roverPhotos =
          roverPhotosResult.map((photo) => Photo.fromJson(photo)).toList();

      return roverPhotos;
    } else {
      throw Exception('${response.statusCode}');
    }
  }

  //pesquisar por camera
  //https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?api_key=DEMO_KEY&sol=1000&camera=fhaz
}
