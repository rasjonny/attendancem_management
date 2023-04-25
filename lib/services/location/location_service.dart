import 'package:attendancem_management/services/location/location.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationService {
  Future<Position?> determinePosition();
  Future<PositionModel> distanceBetweenPositions();
  Future<bool> isOnSite();
}
