// import 'package:geolocator/geolocator.dart';

// Future<Position> getCurrentLocation() async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     return Future.error('Location services are disabled.');
//   }

//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission != LocationPermission.whileInUse &&
//         permission != LocationPermission.always) {
//       return Future.error('Location permissions are denied');
//     }
//   }

//   return await Geolocator.getCurrentPosition();
// }
