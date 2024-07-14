// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:iqra_app/home_page.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   var widgejsonData;

//   loadJsonAsset() async {
//     final String jsonString =
//         await rootBundle.loadString('assets/json/surahs.json');
//     var data = jsonDecode(jsonString);
//     setState(() {
//       widgejsonData = data;
//     });
//   }

//   @override
//   void initState() {
//     Future.delayed(Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//               builder: (_) => HomePage(
//                     suraJsonData: widgejsonData,
//                   )));
//     });
//     loadJsonAsset();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffEAE3CC),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset('assets/images/splash_image22.png'),
//             const SizedBox(
//               height: 30,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
