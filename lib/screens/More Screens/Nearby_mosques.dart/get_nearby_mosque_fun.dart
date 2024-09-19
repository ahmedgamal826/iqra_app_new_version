// import 'package:http/http.dart' as http;
// import 'dart:convert';

// Future<List<Map<String, dynamic>>> _getNearbyMosques(
//     double latitude, double longitude) async {
//   final apiKey = 'AIzaSyAn5qSZRLvjuqmHAAJYCOku3y8TiuRAzZU';
//   final radius = 5000; // Radius in meters
//   final placesUrl =
//       'https://maps.googleapis.com/maps/api/place/nearbysearch/json'
//       '?location=$latitude,$longitude'
//       '&radius=$radius'
//       '&keyword=mosque'
//       '&key=$apiKey';

//   final response = await http.get(Uri.parse(placesUrl));

//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);
//     final results = data['results'] as List;
//     return results.map((result) {
//       return {
//         'name': result['name'],
//         'vicinity': result['vicinity'],
//         'lat': result['geometry']['location']['lat'],
//         'lng': result['geometry']['location']['lng'],
//       };
//     }).toList();
//   } else {
//     throw Exception('Failed to load nearby mosques');
//   }
// }
