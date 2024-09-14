// import 'package:flutter/material.dart';
// import 'package:share_plus/share_plus.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Share Plus"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'Share eclectify University with your friends:',
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             IconButton(
//                 onPressed: sharePressed,
//                 icon: Icon(
//                   Icons.share,
//                   color: Colors.redAccent,
//                 )),
//             Image.asset(
//               "assets/lunch_break.png",
//               width: MediaQuery.of(context).size.width * 0.6,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void sharePressed() {
//     String message = 'Check out eclectify University, where you can become an '
//         'Elite Flutter Developer in no time: https://eclectify-universtiy.web.app';
//     Share.share(message);

//     /// optional subject that will be used when sharing to email
//     // Share.share(message, subject: 'Become An Elite Flutter Developer');

//     /// share a file
//     // Share.shareFiles(['${directory.path}/image.jpg'], text: 'Great picture');
//     /// share multiple files
//     // Share.shareFiles(['${directory.path}/image1.jpg', '${directory.path}/image2.jpg']);
//   }
// }
