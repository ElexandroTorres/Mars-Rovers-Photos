import 'package:mars_rovers_photos/model/photo.dart';

abstract class IRoverPhotosRepository {
  Future<List<Photo>> getPhotosBySol(String roverName, int sol);
  Future<List<Photo>> getPhotosByCamera(String roverName);
  Future<List<Photo>> getLatestPhotos(String roverName);
}
