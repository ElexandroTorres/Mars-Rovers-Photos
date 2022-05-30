import 'dart:convert';
import 'package:mars_rovers_photos/model/rover_manifest.dart';
import 'package:mars_rovers_photos/repositories/interfaces/rover_manifest_repository_interface.dart';
import 'package:http/http.dart' as http;
import 'package:mars_rovers_photos/repositories/mars_rover_photos_api_infos.dart';

class RoverManifestRepository implements IRoverManifestRepository {
  final http.Client client;

  RoverManifestRepository({required this.client});

  @override
  Future<RoverManifest> getRoverManifest(String roverName) async {
    var url =
        'https://api.nasa.gov/mars-photos/api/v1/manifests/${roverName}/?api_key=${apiKey}';

    RoverManifest roverManifest;

    http.Response response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var roverInfos = jsonDecode(response.body);

      roverManifest = RoverManifest.fromMap(roverInfos['photo_manifest']);

      return roverManifest;
    } else {
      throw Exception('${response.statusCode}');
    }
  }
}
