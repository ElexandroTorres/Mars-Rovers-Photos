import 'package:flutter_test/flutter_test.dart';
import 'package:mars_rovers_photos/model/photo.dart';
import 'package:mars_rovers_photos/repositories/rover_photos_repository.dart';
import 'package:mars_rovers_photos/utils/constants.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'rover_photos_repository_test.mocks.dart';
import 'rover_photos_repository_test_data.dart' as mock_data;

@GenerateMocks([http.Client])
main() {
  final client = MockClient();
  final repository = RoverPhotosRepository(client: client);
  group('Get Latest Photos | ', () {
    test('verify if the list is not null', () async {
      when(client.get(Uri.parse(
              'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/latest_photos?api_key=${apiKey}')))
          .thenAnswer(
              (_) async => http.Response(mock_data.jsonLatestPhotos, 200));

      final latestPhotos = await repository.getLatestPhotos('curiosity');
      expect(latestPhotos, isNotNull);
    });
    test(
        'Verify if a Exception is returned when the status code is diferente for 200',
        () async {
      when(client.get(Uri.parse(
              'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/latest_photos?api_key=${apiKey}')))
          .thenAnswer(
              (_) async => http.Response(mock_data.jsonLatestPhotos, 404));

      expect(() async => await repository.getLatestPhotos('curiosity'),
          throwsException);
    });
  });
  group('Get Photos by sol | ', () {
    test('verify if the list of photo is not null, not empty and valid',
        () async {
      when(client.get(Uri.parse(
              'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?api_key=${apiKey}&sol=1')))
          .thenAnswer(
              (_) async => http.Response(mock_data.jsonPhotoBySol, 200));

      final photosBySol = await repository.getPhotosBySol('curiosity', 1);
      expect(photosBySol, isNotNull);
      expect(photosBySol, isNotEmpty);
      expect(photosBySol, isA<List<Photo>>());
    });

    test('Verify if the list is empty in a sol when there is no photos',
        () async {
      when(client.get(Uri.parse(
              'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?api_key=${apiKey}&sol=1000000')))
          .thenAnswer((_) async =>
              http.Response(mock_data.jsonPhotoBySolWithNoPhotos, 200));

      final photosBySol = await repository.getPhotosBySol('curiosity', 1000000);
      expect(photosBySol, isA<List<Photo>>());
      expect(photosBySol, isEmpty);
    });

    test(
        'Verify if a Exception is returned when the status code is diferente for 200',
        () async {
      when(client.get(Uri.parse(
              'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?api_key=${apiKey}&sol=1')))
          .thenAnswer((_) async =>
              http.Response(mock_data.jsonPhotoBySolWithNoPhotos, 404));

      expect(() async => await repository.getPhotosBySol('curiosity', 1),
          throwsException);
    });
  });
}
