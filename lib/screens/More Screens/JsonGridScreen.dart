// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:iqra_app_new_version_22/screens/More%20Screens/HadithListScreen.dart';

// class JsonGridScreen extends StatelessWidget {
//   // List of JSON file paths
//   final List<String> jsonFiles = [
//     'assets/database/ahmed.json',
//     'assets/database/abi_daud.json',
//     'assets/database/bukhari.json',
//     'assets/database/darimi.json',
//     'assets/database/ibn_maja.json',
//     'assets/database/malik.json',
//     'assets/database/muslim.json',
//     'assets/database/nasai.json',
//     'assets/database/trmizi.json',
//   ];

//   // Function to load JSON and navigate to new screen
//   Future<void> loadJsonFile(BuildContext context, String filePath) async {
//     String jsonString = await rootBundle.loadString(filePath);
//     List<dynamic> jsonData = json.decode(jsonString);

//     // Navigate to HadithListScreen with jsonData
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => HadithListScreen(hadithList: jsonData),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('JSON Files Grid')),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3, // Number of buttons per row
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//           ),
//           itemCount: jsonFiles.length,
//           itemBuilder: (context, index) {
//             return ElevatedButton(
//               onPressed: () {
//                 // Load the corresponding JSON file and navigate
//                 loadJsonFile(context, jsonFiles[index]);
//               },
//               child: Text('File ${index + 1}'),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:iqra_app_new_version_22/screens/More%20Screens/HadithListScreen.dart';

class JsonGridScreen extends StatelessWidget {
  // List of JSON file paths and corresponding file names
  final List<Map<String, String>> jsonFiles = [
    {'filePath': 'assets/database/ahmed.json', 'fileName': 'أحاديث أحمد'},
    {
      'filePath': 'assets/database/abi_daud.json',
      'fileName': 'أحاديث أبو داود'
    },
    {'filePath': 'assets/database/bukhari.json', 'fileName': 'أحاديث البخاري'},
    {'filePath': 'assets/database/ibn_maja.json', 'fileName': 'أحاديث بن ماجه'},
    {'filePath': 'assets/database/malik.json', 'fileName': 'أحاديث مالك'},
    {'filePath': 'assets/database/muslim.json', 'fileName': 'أحاديث مسلم'},
    {'filePath': 'assets/database/nasai.json', 'fileName': 'أحاديث النسائي '},
    {'filePath': 'assets/database/trmizi.json', 'fileName': 'أحاديث الترمذي'},
    {'filePath': 'assets/database/darimi.json', 'fileName': 'أحاديث الدرامي'},
  ];

  // Function to load JSON and navigate to new screen
  Future<void> loadJsonFile(
      BuildContext context, String filePath, String fileName) async {
    String jsonString = await rootBundle.loadString(filePath);
    List<dynamic> jsonData = json.decode(jsonString);

    // Navigate to HadithListScreen with jsonData and fileName
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            HadithListScreen(hadithList: jsonData, fileName: fileName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        centerTitle: true,
        backgroundColor: Colors.brown,
        title: const Text(
          'الأحاديث الشريفة',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              'assets/images/prophet_mosque.png',
              width: 45,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of buttons per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: jsonFiles.length,
          itemBuilder: (context, index) {
            String fileName = jsonFiles[index]['fileName']!;
            String filePath = jsonFiles[index]['filePath']!;
            return InkWell(
              onTap: () {
                // Load the corresponding JSON file and navigate
                loadJsonFile(context, filePath, fileName);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.brown,
                  border: Border.all(color: Colors.black, width: 1.5),
                ),

                child: Center(
                  child: Text(
                    fileName,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ), // Display the file name in the button
              ),
            );
          },
        ),
      ),
    );
  }
}
