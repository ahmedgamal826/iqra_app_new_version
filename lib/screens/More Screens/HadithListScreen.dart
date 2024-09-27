// import 'package:flutter/material.dart';

// class HadithListScreen extends StatelessWidget {
//   final List<dynamic> hadithList;

//   // Constructor to accept hadithList
//   HadithListScreen({required this.hadithList});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('')),
//       body: ListView.builder(
//         itemCount: hadithList.length,
//         itemBuilder: (context, index) {
//           final hadith = hadithList[index];
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               padding: EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.orangeAccent.withOpacity(0.2),
//                 border: Border.all(color: Colors.orange, width: 1.5),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Hadith ${index + 1}",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     hadith['hadith'] ??
//                         'No Hadith available', // Display hadith data
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class HadithListScreen extends StatelessWidget {
  final List<dynamic> hadithList;
  final String fileName;

  // Constructor to accept hadithList and fileName
  HadithListScreen({required this.hadithList, required this.fileName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),

        backgroundColor: Colors.brown,
        centerTitle: true,
        title: Text(
          fileName,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ), // Set the file name in the AppBar
      ),
      body: ListView.builder(
        itemCount: hadithList.length,
        itemBuilder: (context, index) {
          final hadith = hadithList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.orangeAccent.withOpacity(0.2),
                border: Border.all(color: Colors.orange, width: 1.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    textAlign: TextAlign.end,
                    "${index + 1} حديث",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  SelectableText(
                    textAlign: TextAlign.center,
                    hadith['hadith'] ?? 'لا يوجد حديث', // Display hadith data
                    style: const TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
