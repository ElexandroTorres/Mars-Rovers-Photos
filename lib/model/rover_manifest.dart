import 'dart:convert';

class RoverManifest {
  String? name;
  String? launchDate;
  String? landingDate;
  String? status;
  int? maxSol;
  String? maxDate;
  int? totalPhotos;

  RoverManifest({
    this.name,
    this.launchDate,
    this.landingDate,
    this.status,
    this.maxSol,
    this.maxDate,
    this.totalPhotos,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'launch_date': launchDate,
      'landing_date': landingDate,
      'status': status,
      'max_sol': maxSol,
      'max_date': maxDate,
      'total_photos': totalPhotos,
    };
  }

  factory RoverManifest.fromMap(Map<String, dynamic> map) {
    return RoverManifest(
      name: map['name'],
      launchDate: map['launch_date'],
      landingDate: map['landing_date'],
      status: map['status'],
      maxSol: map['max_sol']?.toInt(),
      maxDate: map['max_date'],
      totalPhotos: map['total_photos']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory RoverManifest.fromJson(String source) =>
      RoverManifest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RoverManifest(name: $name, launchDate: $launchDate, landingDate: $landingDate, status: $status, maxSol: $maxSol, maxDate: $maxDate, totalPhotos: $totalPhotos)';
  }
}
