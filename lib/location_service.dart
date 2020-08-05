import 'dart:async';
import 'package:location/location.dart';
import 'user_location.dart';
import 'package:latlong/latlong.dart';
import 'home_view.dart';

class LocationService {
  UserLocation _currentLocation;
  Location location = Location();
  final Distance distance = new Distance();
  StreamController<UserLocation> _locationController =
  StreamController<UserLocation>.broadcast();

  double prevLon, prevLat, Lon, Lat;
  static double x, fin = 0;

  LocationService() {
    location.requestPermission().then((granted) {
      if (granted == PermissionStatus.granted) {
        location.onLocationChanged.listen((locationData) {
          if (locationData != null) {
            if(Lon != null && Lat != null){
              prevLon = Lon;
              prevLat = Lat;
            }
            Lon = locationData.longitude;
            Lat = locationData.latitude;
            _locationController.add(UserLocation(
              latitude: locationData.latitude,
              longitude: locationData.longitude,
            ));
            if(prevLon != null && prevLat != null){
              fin += distance(
                  new LatLng(prevLat, prevLon),
                  new LatLng(locationData.latitude, locationData.longitude)
              );
            }
          }
        });
      }
    });
  }

  Stream<UserLocation> get locationStream => _locationController.stream;

  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
    } catch (e) {
      print('Could not get the location: $e');
    }

    return _currentLocation;
  }
}