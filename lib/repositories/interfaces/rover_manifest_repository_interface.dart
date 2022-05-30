import 'package:mars_rovers_photos/model/rover_manifest.dart';

abstract class IRoverManifestRepository {
  Future<RoverManifest> getRoverManifest(String roverName);
}
