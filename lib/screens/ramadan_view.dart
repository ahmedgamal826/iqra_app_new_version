// // import 'package:flutter/material.dart';

// // class RamadanTimetableScreen extends StatefulWidget {
// //   @override
// //   _RamadanTimetableScreenState createState() => _RamadanTimetableScreenState();
// // }

// // class _RamadanTimetableScreenState extends State<RamadanTimetableScreen>
// //     with SingleTickerProviderStateMixin {
// //   late AnimationController _controller;
// //   late Animation<double> _animation;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = AnimationController(
// //       vsync: this,
// //       duration: Duration(seconds: 2),
// //     );
// //     _animation = Tween<double>(begin: -300, end: 0).animate(
// //       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
// //     );
// //     _controller.forward();
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         title: Text(
// //           "إمساكية رمضان",
// //           style: TextStyle(
// //             fontSize: 24,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         centerTitle: true,
// //         backgroundColor: Colors.orangeAccent,
// //       ),
// //       body: Center(
// //         child: AnimatedBuilder(
// //           animation: _animation,
// //           builder: (context, child) {
// //             return Transform.translate(
// //               offset: Offset(0, _animation.value),
// //               child: child,
// //             );
// //           },
// //           child: Container(
// //             margin: EdgeInsets.all(16),
// //             decoration: BoxDecoration(
// //               borderRadius: BorderRadius.circular(20),
// //               boxShadow: [
// //                 BoxShadow(
// //                   color: Colors.black26,
// //                   blurRadius: 10,
// //                   spreadRadius: 2,
// //                 ),
// //               ],
// //             ),
// //             child: ClipRRect(
// //               borderRadius: BorderRadius.circular(20),
// //               child: Image.asset(
// //                 'assets/images/ramadan.jpg',
// //                 // fit: BoxFit.fill,
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// class RamadanTimetableScreen extends StatefulWidget {
//   @override
//   _RamadanTimetableScreenState createState() => _RamadanTimetableScreenState();
// }

// class _RamadanTimetableScreenState extends State<RamadanTimetableScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     );
//     _animation = Tween<double>(begin: -300, end: 0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "إمساكية رمضان",
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.orangeAccent,
//       ),
//       body: Stack(
//         children: [
//           AnimatedBuilder(
//             animation: _animation,
//             builder: (context, child) {
//               return Transform.translate(
//                 offset: Offset(0, _animation.value),
//                 child: child,
//               );
//             },
//             child: SizedBox.expand(
//               child: Image.asset(
//                 'assets/images/ramadan.jpg',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class RamadanTimetableScreen extends StatefulWidget {
  @override
  _RamadanTimetableScreenState createState() => _RamadanTimetableScreenState();
}

class _RamadanTimetableScreenState extends State<RamadanTimetableScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: -300, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "2025 إمساكية رمضان",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _animation.value),
                child: child,
              );
            },
            child: SizedBox.expand(
              child: Image.asset(
                'assets/images/ramadan.jpg',
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
