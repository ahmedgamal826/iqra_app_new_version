// import 'package:flutter/material.dart';

// class MosqueListScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> mosques;

//   MosqueListScreen({required this.mosques});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Nearby Mosques')),
//       body: ListView.builder(
//         itemCount: mosques.length,
//         itemBuilder: (context, index) {
//           final mosque = mosques[index];
//           return ListTile(
//             title: Text(mosque['name']),
//             subtitle: Text(mosque['vicinity']),
//             trailing: Text('${mosque['lat']}, ${mosque['lng']}'),
//           );
//         },
//       ),
//     );
//   }
// }
