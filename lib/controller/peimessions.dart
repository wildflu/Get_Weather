import 'package:geolocator/geolocator.dart';

class GeoLocatorPermmissions {

  GeoLocatorPermmissions() {
    determinePosition();
  }
  Future determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("service des Enabled");
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("LocationPermission denied");   
        return Future.error('Location permissions are denied');
      }else {
        if (permission == LocationPermission.whileInUse){
          print("LocationPermission whileInUse");
        }
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      print("LocationPermission deniedForever");
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    } 
  }
}


/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
