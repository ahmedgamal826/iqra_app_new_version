// // import 'package:flutter/material.dart';
// // import 'package:iqra_app_new_version_22/Names_page/Names.dart';

// // class MoreScreen extends StatelessWidget {
// //   const MoreScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.brown,
// //         centerTitle: true,
// //         title: const Text(
// //           'أدوات ومزايا',
// //           style: TextStyle(
// //             fontSize: 25,
// //             fontWeight: FontWeight.bold,
// //             color: Colors.white,
// //           ),
// //         ),
// //       ),
// //       body: GridView(
// //         gridDelegate:
// //             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
// //         children: [
// //           const SizedBox(
// //             height: 20,
// //           ),
// //           Column(
// //             children: [
// //               InkWell(
// //                 onTap: () {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => Names(),
// //                     ),
// //                   );
// //                 },
// //                 child: CircleAvatar(
// //                   backgroundColor: Colors.brown,
// //                   radius: 40,
// //                   child: Image.asset(
// //                     'assets/images/allah.png',
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //               ),
// //               const Text(
// //                 'أسماء الله الحسني',
// //                 style: TextStyle(
// //                   fontSize: 20,
// //                   color: Colors.brown,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               )
// //             ],
// //           ),
// //           Column(
// //             children: [
// //               InkWell(
// //                 onTap: () {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => Names(),
// //                     ),
// //                   );
// //                 },
// //                 child: CircleAvatar(
// //                   backgroundColor: Colors.brown,
// //                   radius: 40,
// //                   child: Image.asset(
// //                     'assets/images/allah.png',
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //               ),
// //               const Text(
// //                 'أسماء الله الحسني',
// //                 style: TextStyle(
// //                   fontSize: 20,
// //                   color: Colors.brown,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               )
// //             ],
// //           ),
// //           Column(
// //             children: [
// //               InkWell(
// //                 onTap: () {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => Names(),
// //                     ),
// //                   );
// //                 },
// //                 child: CircleAvatar(
// //                   backgroundColor: Colors.brown,
// //                   radius: 40,
// //                   child: Image.asset(
// //                     'assets/images/allah.png',
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //               ),
// //               const Text(
// //                 'أسماء الله الحسني',
// //                 style: TextStyle(
// //                   fontSize: 20,
// //                   color: Colors.brown,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               )
// //             ],
// //           ),
// //           Column(
// //             children: [
// //               InkWell(
// //                 onTap: () {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => Names(),
// //                     ),
// //                   );
// //                 },
// //                 child: CircleAvatar(
// //                   backgroundColor: Colors.brown,
// //                   radius: 40,
// //                   child: Image.asset(
// //                     'assets/images/allah.png',
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //               ),
// //               const Text(
// //                 'أسماء الله الحسني',
// //                 style: TextStyle(
// //                   fontSize: 20,
// //                   color: Colors.brown,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               )
// //             ],
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:iqra_app_new_version_22/Names_page/Names.dart';

// class MoreScreen extends StatelessWidget {
//   const MoreScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.brown,
//         centerTitle: true,
//         title: const Text(
//           'أدوات ومزايا',
//           style: TextStyle(
//             fontSize: 25,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: GridView.builder(
//         padding: const EdgeInsets.all(16.0),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 16.0, // Space between columns
//           mainAxisSpacing: 16.0, // Space between rows
//         ),
//         itemCount: 4,
//         itemBuilder: (context, index) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => Names(),
//                     ),
//                   );
//                 },
//                 child: CircleAvatar(
//                   backgroundColor: Colors.brown,
//                   radius: 40,
//                   child: Image.asset(
//                     'assets/images/allah.png',
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 8.0),
//               const Text(
//                 'أسماء الله الحسني',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.brown,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/models/gridItem_names_model.dart';
import 'package:iqra_app_new_version_22/screens/More%20Screens/Ahades_page/home_page_ahades.dart';
import 'package:iqra_app_new_version_22/screens/More%20Screens/Names_page/Names.dart';
import 'package:iqra_app_new_version_22/screens/More%20Screens/Nearby_mosques.dart/mosque_list_screen.dart';
import 'package:iqra_app_new_version_22/screens/Qiblah%20Screen/qibla_screen.dart';
import 'package:iqra_app_new_version_22/screens/Stories%20Screens/stories_screen.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the grid items
    final List<GridItem> items = [
      GridItem(
        name: 'أسماء الله الحسني',
        imagePath: 'assets/images/allah.png',
        destinationPage: Names(), // Replace with the actual page
      ),
      GridItem(
        name: 'الاحاديث الشريفة',
        imagePath: 'assets/images/prophet.png',
        destinationPage: HomePageAhades(), // Replace with the actual page
      ),
      GridItem(
        name: 'القبلة',
        imagePath: 'assets/images/qibla.png',
        destinationPage: QiblahScreen(), // Replace with the actual page
      ),
      GridItem(
        name: 'قصص دينية',
        imagePath: 'assets/images/stories_icon.png',
        destinationPage: StoriesScreen(), // Replace with the actual page
      ),
      // GridItem(
      //   name: 'المساجد القريبة',
      //   imagePath: 'assets/images/prophet.png',
      //   destinationPage: MosqueListScreen(
      //     mosques: [],
      //   ), // Replace with the actual page
      // ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: const Text(
          'أدوات ومزايا',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => item.destinationPage,
                    ),
                  );
                },
                child: CircleAvatar(
                  backgroundColor: Colors.brown,
                  radius: 40,
                  child: Image.asset(
                    item.imagePath,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                item.name,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
