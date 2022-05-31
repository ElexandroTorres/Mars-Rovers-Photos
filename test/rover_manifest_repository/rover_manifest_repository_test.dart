import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mars_rovers_photos/model/rover_manifest.dart';
import 'package:mars_rovers_photos/repositories/mars_rover_photos_api_infos.dart';
import 'package:mars_rovers_photos/repositories/rover_manifest_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
//import 'rover_manifest_repository_test.mocks.dart';
import 'rover_manifest_repository_test.mocks.dart';
import 'rover_manifest_repository_test_data.dart' as mock_data;
//import 'rover_manifest_repository_test_data.dart' as mock_data;

@GenerateMocks([http.Client])
main() {
  final client = MockClient();

  final repository = RoverManifestRepository(client: client);
  group('Rover Infos | ', () {
    group('Curiosity |', () {
      test('Check rover name', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/curiosity/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataCuriosity, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('curiosity');

        expect(manifest.name, isNotNull);
        expect(manifest.name, isA<String>());
        expect(manifest.name, 'Curiosity');
      });
      test('Check launch date', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/curiosity/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataCuriosity, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('curiosity');

        expect(manifest.launchDate, isNotNull);
        expect(manifest.launchDate, isA<String>());
        expect(manifest.launchDate, '2011-11-26');
      });
      test('Check landing date', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/curiosity/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataCuriosity, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('curiosity');

        expect(manifest.landingDate, isNotNull);
        expect(manifest.landingDate, isA<String>());
        expect(manifest.landingDate, '2012-08-06');
      });
      test('Check mission status', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/curiosity/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataCuriosity, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('curiosity');

        expect(manifest.status, isNotNull);
        expect(manifest.status, isA<String>());
        expect(manifest.status, 'active');
      });
      test('Check Max Sol', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/curiosity/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataCuriosity, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('curiosity');
        expect(manifest.totalPhotos, isNotNull);
        expect(manifest.totalPhotos, isA<int>());
      });
      test('Check Max Date', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/curiosity/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataCuriosity, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('curiosity');
        expect(manifest.status, isNotNull);
        expect(manifest.status, isA<String>());
      });
      test('Check Total photos', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/curiosity/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataCuriosity, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('curiosity');
        expect(manifest.totalPhotos, isNotNull);
        expect(manifest.totalPhotos, isA<int>());
      });
    });
    group('Spirit |', () {
      test('Check rover name', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/spirit/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataSpirit, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('spirit');

        expect(manifest.name, isNotNull);
        expect(manifest.name, isA<String>());
        expect(manifest.name, 'Spirit');
      });

      test('Check launch date', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/spirit/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataSpirit, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('spirit');

        expect(manifest.launchDate, isNotNull);
        expect(manifest.launchDate, isA<String>());
        expect(manifest.launchDate, '2003-06-10');
      });

      test('Check landing date', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/spirit/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataSpirit, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('spirit');

        expect(manifest.landingDate, isNotNull);
        expect(manifest.landingDate, isA<String>());
        expect(manifest.landingDate, '2004-01-04');
      });

      test('Check mission status', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/spirit/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataSpirit, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('spirit');

        expect(manifest.status, isNotNull);
        expect(manifest.status, isA<String>());
        expect(manifest.status, 'complete');
      });

      test('Check Max Sol', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/spirit/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataSpirit, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('spirit');
        expect(manifest.totalPhotos, isNotNull);
        expect(manifest.totalPhotos, isA<int>());
      });

      test('Check Max Date', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/spirit/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataSpirit, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('spirit');
        expect(manifest.status, isNotNull);
        expect(manifest.status, isA<String>());
      });

      test('Check Total photos', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/spirit/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataSpirit, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('spirit');
        expect(manifest.totalPhotos, isNotNull);
        expect(manifest.totalPhotos, isA<int>());
      });
    });
    group('Opportunity |', () {
      test('Check rover name', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/opportunity/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataOpportunity, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('opportunity');

        expect(manifest.name, isNotNull);
        expect(manifest.name, isA<String>());
        expect(manifest.name, 'Opportunity');
      });

      test('Check launch date', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/oportunity/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataOpportunity, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('opportunity');

        expect(manifest.launchDate, isNotNull);
        expect(manifest.launchDate, isA<String>());
        expect(manifest.launchDate, '2003-07-07');
      });

      test('Check landing date', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/oportunity/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataOpportunity, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('opportunity');

        expect(manifest.landingDate, isNotNull);
        expect(manifest.landingDate, isA<String>());
        expect(manifest.landingDate, '2004-01-25');
      });

      test('Check mission status', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/oportunity/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataOpportunity, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('opportunity');

        expect(manifest.status, isNotNull);
        expect(manifest.status, isA<String>());
        expect(manifest.status, 'complete');
      });

      test('Check Max Sol', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/oportunity/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataOpportunity, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('opportunity');
        expect(manifest.totalPhotos, isNotNull);
        expect(manifest.totalPhotos, isA<int>());
      });

      test('Check Max Date', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/oportunity/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataCuriosity, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('opportunity');
        expect(manifest.status, isNotNull);
        expect(manifest.status, isA<String>());
      });

      test('Check Total photos', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/oportunity/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataCuriosity, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('opportunity');
        expect(manifest.totalPhotos, isNotNull);
        expect(manifest.totalPhotos, isA<int>());
      });
    });
    group('Perseverance |', () {
      test('Check rover name', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/perseverance/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataPerseverance, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('perseverance');

        expect(manifest.name, isNotNull);
        expect(manifest.name, isA<String>());
        expect(manifest.name, 'Perseverance');
      });
      test('Check launch date', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/perseverance/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataPerseverance, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('perseverance');

        expect(manifest.launchDate, isNotNull);
        expect(manifest.launchDate, isA<String>());
        expect(manifest.launchDate, '2020-07-30');
      });
      test('Check landing date', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/perseverance/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataPerseverance, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('perseverance');

        expect(manifest.landingDate, isNotNull);
        expect(manifest.landingDate, isA<String>());
        expect(manifest.landingDate, '2021-02-18');
      });
      test('Check mission status', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/perseverance/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataPerseverance, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('perseverance');

        expect(manifest.status, isNotNull);
        expect(manifest.status, isA<String>());
        expect(manifest.status, 'active');
      });
      test('Check Max Sol', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/perseverance/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataPerseverance, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('perseverance');
        expect(manifest.totalPhotos, isNotNull);
        expect(manifest.totalPhotos, isA<int>());
      });
      test('Check Max Date', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/perseverance/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataPerseverance, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('perseverance');
        expect(manifest.status, isNotNull);
        expect(manifest.status, isA<String>());
      });
      test('Check Total photos', () async {
        when(client.get(Uri.parse(
                'https://api.nasa.gov/mars-photos/api/v1/manifests/perseverance/?api_key=${apiKey}')))
            .thenAnswer((_) async =>
                http.Response(mock_data.jsonManifestDataPerseverance, 200));

        final RoverManifest manifest =
            await repository.getRoverManifest('perseverance');
        expect(manifest.totalPhotos, isNotNull);
        expect(manifest.totalPhotos, isA<int>());
      });
    });
  });
  group('Request StatusCode | ', () {
    test('Return a Exception if status code is diferente for 200', () async {
      when(client.get(Uri.parse(
              'https://api.nasa.gov/mars-photos/api/v1/manifests/curiosity/?api_key=${apiKey}')))
          .thenAnswer((_) async =>
              http.Response(mock_data.jsonManifestDataCuriosity, 404));

      expect(() async => await repository.getRoverManifest('curiosity'),
          throwsException);
    });
  });
}
