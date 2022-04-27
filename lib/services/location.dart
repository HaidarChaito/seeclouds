import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Location {
  late double latitude = 0;
  late double longitude = 0;
  String? city;
  LocationPermission? permission;

  Future<void> getCurrentLocation() async {
    try {
      permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      await GetAddressFromLatLong();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> GetAddressFromLatLong() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemarks[0];
    city = ' ${place.country}, \n${place.locality}';
  }

  Future<bool> checkPermissions() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      return true;
    } else {
      return false;
    }
  }

  void requestPermissions() async {
    permission = await Geolocator.requestPermission();
  }
}
