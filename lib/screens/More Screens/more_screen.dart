// // import 'package:flutter/material.dart';
// // import 'package:iqra_app_new_version_22/models/gridItem_names_model.dart';
// // import 'package:iqra_app_new_version_22/screens/More%20Screens/Ahades_page/home_page_ahades.dart';
// // import 'package:iqra_app_new_version_22/screens/More%20Screens/JsonGridScreen.dart';
// // import 'package:iqra_app_new_version_22/screens/More%20Screens/Names_page/Names.dart';
// // import 'package:iqra_app_new_version_22/screens/Qiblah%20Screen/qibla_screen.dart';
// // import 'package:iqra_app_new_version_22/screens/Stories%20Screens/stories_screen.dart';

// // class MoreScreen extends StatelessWidget {
// //   const MoreScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     // Define the grid items
// //     final List<GridItem> items = [
// //       GridItem(
// //         name: 'أسماء الله الحسني',
// //         imagePath: 'assets/images/allah.png',
// //         destinationPage: Names(), // Replace with the actual page
// //       ),
// //       GridItem(
// //         name: 'الاحاديث الشريفة',
// //         imagePath: 'assets/images/prophet.png',
// //         destinationPage: JsonGridScreen(), // Replace with the actual page
// //       ),

// //       GridItem(
// //         name: 'القبلة',
// //         imagePath: 'assets/images/qibla.png',
// //         destinationPage: QiblahScreen(), // Replace with the actual page
// //       ),
// //       GridItem(
// //         name: 'قصص دينية',
// //         imagePath: 'assets/images/stories_icon.png',
// //         destinationPage: StoriesScreen(), // Replace with the actual page
// //       ),

// //       GridItem(
// //         name: 'أحاديث متنوعة',
// //         imagePath: 'assets/images/prophet.png',
// //         destinationPage: HomePageAhades(), // Replace with the actual page
// //       ),

// //       // GridItem(
// //       //   name: 'المساجد القريبة',
// //       //   imagePath: 'assets/images/prophet.png',
// //       //   destinationPage: MosqueListScreen(
// //       //     mosques: [],
// //       //   ), // Replace with the actual page
// //       // ),
// //     ];

// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.brown,
// //         centerTitle: true,
// //         title: const Text(
// //           'أدوات ومزايا',
// //           style: TextStyle(
// //             fontSize: 30,
// //             fontWeight: FontWeight.bold,
// //             color: Colors.white,
// //           ),
// //         ),
// //       ),
// //       body: GridView.builder(
// //         padding: const EdgeInsets.all(16.0),
// //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //           crossAxisCount: 2,
// //           crossAxisSpacing: 16.0,
// //           mainAxisSpacing: 16.0,
// //         ),
// //         itemCount: items.length,
// //         itemBuilder: (context, index) {
// //           final item = items[index];
// //           return Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               InkWell(
// //                 onTap: () {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => item.destinationPage,
// //                     ),
// //                   );
// //                 },
// //                 child: CircleAvatar(
// //                   backgroundColor: Colors.brown,
// //                   radius: 40,
// //                   child: Image.asset(
// //                     item.imagePath,
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(height: 8.0),
// //               Text(
// //                 item.name,
// //                 style: const TextStyle(
// //                   fontSize: 20,
// //                   color: Colors.brown,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //             ],
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:iqra_app_new_version_22/models/gridItem_names_model.dart';
// import 'package:iqra_app_new_version_22/screens/More%20Screens/Ahades_page/home_page_ahades.dart';
// import 'package:iqra_app_new_version_22/screens/More%20Screens/JsonGridScreen.dart';
// import 'package:iqra_app_new_version_22/screens/More%20Screens/Names_page/Names.dart';
// import 'package:iqra_app_new_version_22/screens/Qiblah%20Screen/qibla_screen.dart';
// import 'package:iqra_app_new_version_22/screens/Stories%20Screens/stories_screen.dart';

// class MoreScreen extends StatelessWidget {
//   const MoreScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<GridItem> items = [
//       GridItem(
//           name: 'أسماء الله الحسني',
//           imagePath: 'assets/images/allah.png',
//           destinationPage: Names()),
//       GridItem(
//           name: 'الاحاديث الشريفة',
//           imagePath: 'assets/images/prophet.png',
//           destinationPage: JsonGridScreen()),
//       GridItem(
//           name: 'القبلة',
//           imagePath: 'assets/images/qibla.png',
//           destinationPage: QiblahScreen()),
//       GridItem(
//           name: 'قصص دينية',
//           imagePath: 'assets/images/stories_icon.png',
//           destinationPage: StoriesScreen()),
//       GridItem(
//           name: 'أحاديث متنوعة',
//           imagePath: 'assets/images/prophet.png',
//           destinationPage: HomePageAhades()),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         centerTitle: true,
//         title: const Text(
//           'أدوات ومزايا',
//           style: TextStyle(
//               fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 16.0,
//             mainAxisSpacing: 16.0,
//             childAspectRatio: 1,
//           ),
//           itemCount: items.length,
//           itemBuilder: (context, index) {
//             final item = items[index];
//             return InkWell(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => item.destinationPage),
//                 );
//               },
//               splashColor: Colors.greenAccent,
//               borderRadius: BorderRadius.circular(16.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.green.shade100,
//                   borderRadius: BorderRadius.circular(16.0),
//                   boxShadow: const [
//                     BoxShadow(
//                         color: Colors.black26,
//                         blurRadius: 4,
//                         offset: Offset(2, 2)),
//                   ],
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: Colors.green,
//                       radius: 40,
//                       child: Image.asset(item.imagePath,
//                           color: Colors.white, width: 50, height: 50),
//                     ),
//                     const SizedBox(height: 10),
//                     Text(
//                       item.name,
//                       style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.green),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/models/gridItem_names_model.dart';
import 'package:iqra_app_new_version_22/screens/Azkar_page/azkar_screen.dart';
import 'package:iqra_app_new_version_22/screens/Islamic_questions/Islamic_questions_view.dart';
import 'package:iqra_app_new_version_22/screens/More%20Screens/Ahades_page/home_page_ahades.dart';
import 'package:iqra_app_new_version_22/screens/More%20Screens/JsonGridScreen.dart';
import 'package:iqra_app_new_version_22/screens/More%20Screens/Names_page/Names.dart';
import 'package:iqra_app_new_version_22/screens/More%20Screens/Tasbih_page/askar_tasbih_page.dart';
import 'package:iqra_app_new_version_22/screens/Qiblah%20Screen/qibla_screen.dart';
import 'package:iqra_app_new_version_22/screens/Quran%20Audios%20Newwwwww/quran_audio_neww.dart';
import 'package:iqra_app_new_version_22/screens/Quran_page/views/reciters_view.dart';
import 'package:iqra_app_new_version_22/screens/Ruqya%20Screen/ruqya_view.dart';
import 'package:iqra_app_new_version_22/screens/Stories%20Screens/stories_screen.dart';
import 'package:iqra_app_new_version_22/screens/ramadan_view.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<GridItem> items = [
      GridItem(
          name: 'أسماء الله الحسني',
          imagePath: 'assets/images/allah.png',
          destinationPage: Names()),
      GridItem(
        name: 'القرآن إستماع',
        imagePath: 'assets/images/audiobook.png',
        destinationPage: RecitersListScreen(),
      ),

      GridItem(
        name: 'أذكار المسلم',
        imagePath: 'assets/images/azkar_photo.png',
        destinationPage: AzkarHomePage(),
      ),
      // GridItem(
      //     name: 'الاحاديث الشريفة',
      //     imagePath: 'assets/images/prophet.png',
      //     destinationPage: JsonGridScreen()),
      GridItem(
          name: 'اتجاه القبلة',
          imagePath: 'assets/images/qibla_new.png',
          destinationPage: QiblahScreen()),
      GridItem(
          name: 'قصص دينية',
          imagePath: 'assets/images/stories_icon.png',
          destinationPage: StoriesScreen()),
      GridItem(
          name: 'الأحاديث الشريفة',
          imagePath: 'assets/images/prophet.png',
          destinationPage: HomePageAhades()),
      GridItem(
          name: 'الرقية الشرعية',
          imagePath: 'assets/images/raquah_icon.png',
          destinationPage: RaquahScreen()),
      GridItem(
          name: 'أسئلة دينية',
          imagePath: 'assets/images/islamicquiz.png',
          destinationPage: IslamicQuizPage()),
      GridItem(
          name: 'إمساكية رمضان',
          imagePath: 'assets/images/ramadan-celebration.png',
          destinationPage: RamadanTimetableScreen()),
      GridItem(
          name: 'السبحة الإلكترونية',
          imagePath: 'assets/images/rosary_iconnn.png',
          destinationPage: AzkarTasbihScreen()),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          'أدوات ومزايا',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 0.9,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item.destinationPage),
                );
              },
              child: Card(
                elevation: 7,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(item.imagePath, width: 50, height: 50),
                    const SizedBox(height: 8),
                    Text(
                      maxLines: 2,
                      item.name,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
