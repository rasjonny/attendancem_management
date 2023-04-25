import 'package:attendancem_management/services/location/location_service.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

class PositionModel {
  final double altitude;
  final double distanceBetween;

  PositionModel( {
   required this.altitude,
    required this.distanceBetween,
  });
}

class LocationServiceImpl implements LocationService {
  

  @override
  Future<Position?> determinePosition() async {
    bool serviceEnabled;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled) {
      final position = await Geolocator.getCurrentPosition();
      position.latitude.log();
      position.longitude.log();
      position.altitude.log();
      return position;
    } else {
      await Geolocator.openLocationSettings();
      return null;
    }

//await Geolocator.openAppSettings();
//await Geolocator.openLocationSettings();
  }

  @override
  Future<PositionModel> distanceBetweenPositions() async {
    final position = await determinePosition();
    final distanceBetween = Geolocator.distanceBetween(
      position!.latitude,
      position.longitude,
      9.0147013,
      38.7895076,
    );
    return PositionModel(altitude:position.altitude,  distanceBetween:distanceBetween);
  }

  @override
  Future<bool> isOnSite() async {
    final position = await distanceBetweenPositions();
    int distanceBetween = position.distanceBetween.floor();
    distanceBetween.log();
    final altitude = position.altitude;
    if (distanceBetween <= 5 && altitude <= 5) {
      return true;
    } else {
      return false;
    }
  }
}
