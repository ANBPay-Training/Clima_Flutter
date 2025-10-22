import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;
  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.low,
    // distanceFilter: 100,
  );
  Future<void> getCurrentLocation() async {
    // By failing to prepare, you are preparing to fail.
    try {
      // async help to get these time consuming tasks to happen in the background instead of happening in the foreground
      Position position = await Geolocator.getCurrentPosition(
          locationSettings: locationSettings);
      LocationPermission permission = await Geolocator.requestPermission();
      print(position);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
