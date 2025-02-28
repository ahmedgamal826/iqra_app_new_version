// // import 'package:flutter/material.dart';
// // import 'package:iqra_app_new_version_22/screens/Quran_page/views/surah_reciters_view.dart';

// // class RecitersListView extends StatelessWidget {
// //   const RecitersListView({
// //     super.key,
// //     required this.reciters,
// //   });

// //   final List<Map<String, dynamic>> reciters;

// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView.builder(
// //       itemCount: reciters.length,
// //       itemBuilder: (context, index) {
// //         return GestureDetector(
// //           onTap: () {
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(
// //                 builder: (context) =>
// //                     SurahRecitersView(reciter: reciters[index]),
// //               ),
// //             );
// //           },
// //           child: Card(
// //             color: Colors.white,
// //             margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
// //             elevation: 7,
// //             shape: RoundedRectangleBorder(
// //               borderRadius: BorderRadius.circular(15),
// //             ),
// //             child: Directionality(
// //               textDirection: TextDirection.rtl,
// //               child: ListTile(
// //                 leading: CircleAvatar(
// //                   backgroundColor: Colors.green[100],
// //                   child: Icon(Icons.person, color: Colors.green[700]),
// //                 ),
// //                 title: Text(
// //                   'الشيخ ${reciters[index]['name']}',
// //                   style: const TextStyle(
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //                 trailing: const Icon(Icons.arrow_forward_ios_outlined,
// //                     color: Colors.green),
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(15),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:iqra_app_new_version_22/screens/Quran_page/views/surah_reciters_view.dart';

// class RecitersListView extends StatelessWidget {
//   const RecitersListView({
//     super.key,
//     required this.reciters,
//   });

//   final List<Map<String, dynamic>> reciters;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: reciters.length,
//       itemBuilder: (context, index) {
//         final reciter = reciters[index];
//         final String? serverUrl =
//             reciter['moshaf'] != null && reciter['moshaf'].isNotEmpty
//                 ? reciter['moshaf'][0]['server']
//                 : null;

//         return GestureDetector(
//           onTap: () {
//             if (serverUrl != null) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => SurahRecitersPage(
//                     reciter: reciter,
//                   ),
//                 ),
//               );
//             } else {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(
//                   content: Text('حدث خطأ في تحميل بيانات القارئ'),
//                   backgroundColor: Colors.red,
//                 ),
//               );
//             }
//           },
//           child: Card(
//             color: Colors.white,
//             margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//             elevation: 7,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Directionality(
//               textDirection: TextDirection.rtl,
//               child: ListTile(
//                 leading: CircleAvatar(
//                   backgroundColor: Colors.green[100],
//                   child: Icon(Icons.person, color: Colors.green[700]),
//                 ),
//                 title: Text(
//                   'الشيخ ${reciter['name']}',
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 trailing: const Icon(Icons.arrow_forward_ios_outlined,
//                     color: Colors.green),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
