import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.low,
    // distanceFilter: 100,
  );
  void getLocation() async {
    // async help to get these time consuming tasks to happen in the background instead of happening in the foreground
    Position position =
        await Geolocator.getCurrentPosition(locationSettings: locationSettings);

    LocationPermission permission = await Geolocator.requestPermission();
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getLocation(); //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
