// // // // // import 'package:flutter/material.dart';

// // // // // class FollowPrayers extends StatefulWidget {
// // // // //   @override
// // // // //   _FollowPrayersState createState() => _FollowPrayersState();
// // // // // }

// // // // // class _FollowPrayersState extends State<FollowPrayers> {
// // // // //   // قائمة لتخزين حالة كل أيقونة
// // // // //   List<bool> _prayerCompleted = [false, false, false, false, false];
// // // // //   int _completedCount = 0; // عداد الصلوات المكتملة

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     double screenHeight = MediaQuery.of(context).size.height;

// // // // //     return Padding(
// // // // //       padding: const EdgeInsets.symmetric(horizontal: 15),
// // // // //       child: Container(
// // // // //         width: double.infinity,
// // // // //         height: screenHeight * 0.2, // زيادة الارتفاع لإفساح المجال للأرقام
// // // // //         decoration: BoxDecoration(
// // // // //           color: Colors.brown,
// // // // //           borderRadius: BorderRadius.circular(20),
// // // // //         ),
// // // // //         child: Stack(
// // // // //           alignment: Alignment.center,
// // // // //           children: [
// // // // //             // Divider
// // // // //             const Positioned.fill(
// // // // //               child: Align(
// // // // //                 alignment: Alignment.center,
// // // // //                 child: Divider(
// // // // //                   thickness: 2, // سمك الخط
// // // // //                   color: Colors.white, // لون الخط
// // // // //                   indent: 20, // المسافة من الطرف الأيسر
// // // // //                   endIndent: 20, // المسافة من الطرف الأيمن
// // // // //                 ),
// // // // //               ),
// // // // //             ),
// // // // //             Column(
// // // // //               mainAxisAlignment: MainAxisAlignment.center,
// // // // //               children: [
// // // // //                 Text(
// // // // //                   'لقد قمت بأداء $_completedCount / 5 صلوات اليوم',
// // // // //                   style: const TextStyle(
// // // // //                     fontSize: 18,
// // // // //                     color: Colors.white,
// // // // //                   ),
// // // // //                 ),
// // // // //                 const SizedBox(height: 10), // مساحة بين النص والخط
// // // // //                 Row(
// // // // //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // // //                   children: List.generate(5, (index) {
// // // // //                     return Expanded(
// // // // //                       child: Column(
// // // // //                         mainAxisSize: MainAxisSize.min,
// // // // //                         children: [
// // // // //                           IconButton(
// // // // //                             icon: Icon(
// // // // //                               _prayerCompleted[index]
// // // // //                                   ? Icons.check_circle
// // // // //                                   : Icons.check_circle_outline,
// // // // //                               color: _prayerCompleted[index]
// // // // //                                   ? Colors.green
// // // // //                                   : Colors.grey,
// // // // //                               size: 45, // حجم الأيقونة
// // // // //                             ),
// // // // //                             onPressed: () {
// // // // //                               setState(() {
// // // // //                                 _prayerCompleted[index] =
// // // // //                                     !_prayerCompleted[index];
// // // // //                                 _completedCount = _prayerCompleted
// // // // //                                     .where((completed) => completed)
// // // // //                                     .length;
// // // // //                               });
// // // // //                             },
// // // // //                           ),
// // // // //                           const SizedBox(height: 10),
// // // // //                           Text(
// // // // //                             _getFollowPrayerName(index),
// // // // //                             style: const TextStyle(
// // // // //                               color: Colors.white,
// // // // //                               fontSize: 18,
// // // // //                               fontWeight: FontWeight.bold,
// // // // //                             ),
// // // // //                           ),
// // // // //                         ],
// // // // //                       ),
// // // // //                     );
// // // // //                   }),
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   String _getFollowPrayerName(int index) {
// // // // //     const prayers = ['العشاء', 'المغرب', 'العصر', 'الظهر', 'الفجر'];
// // // // //     return prayers[index];
// // // // //   }
// // // // // }

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:iqra_app_new_version_22/models/prayer_times_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class FollowPrayers extends StatefulWidget {
//   final PrayerTimes prayerTimes;

//   const FollowPrayers({required this.prayerTimes, Key? key}) : super(key: key);

//   @override
//   _FollowPrayersState createState() => _FollowPrayersState();
// }

// class _FollowPrayersState extends State<FollowPrayers> {
//   List<bool> _prayerCompleted = [false, false, false, false, false];
//   int _completedCount = 0;

//   @override
//   void initState() {
//     super.initState();
//     _loadPrayerStatus();
//     _resetDailyStatus();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       child: Container(
//         width: double.infinity,
//         height: screenHeight * 0.2,
//         decoration: BoxDecoration(
//           color: Colors.brown,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             const Positioned.fill(
//               child: Align(
//                 alignment: Alignment.center,
//                 child: Divider(
//                   thickness: 2,
//                   color: Colors.white,
//                   indent: 20,
//                   endIndent: 20,
//                 ),
//               ),
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'لقد قمت بأداء $_completedCount / 5 صلوات اليوم',
//                   style: const TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: List.generate(5, (index) {
//                     int reversedIndex = 4 - index; // Reverse the index
//                     return Expanded(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             icon: Icon(
//                               _prayerCompleted[reversedIndex]
//                                   ? Icons.check_circle
//                                   : Icons.check_circle_outline,
//                               color: _prayerCompleted[reversedIndex] &&
//                                       _isPrayerTimePassed(reversedIndex)
//                                   ? Colors.green
//                                   : Colors.grey,
//                               size: 45,
//                             ),
//                             onPressed: () {
//                               if (_isPrayerTimePassed(reversedIndex)) {
//                                 setState(() {
//                                   _prayerCompleted[reversedIndex] =
//                                       !_prayerCompleted[reversedIndex];
//                                   _completedCount = _prayerCompleted
//                                       .where((completed) => completed)
//                                       .length;
//                                 });
//                                 _savePrayerStatus();
//                               } else {
//                                 _showTimeNotReachedDialog(reversedIndex);
//                               }
//                             },
//                           ),
//                           const SizedBox(height: 10),
//                           Text(
//                             _getFollowPrayerName(reversedIndex),
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   }),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   String _getFollowPrayerName(int index) {
//     const prayers = ['الفجر', 'الظهر', 'العصر', 'المغرب', 'العشاء'];
//     return prayers[index];
//   }

//   bool _isPrayerTimePassed(int index) {
//     DateTime now = DateTime.now();
//     DateFormat dateFormat = DateFormat('HH:mm');
//     Map<String, DateTime> prayerTimes = {
//       'الفجر': dateFormat.parse(widget.prayerTimes.fajr),
//       'الظهر': dateFormat.parse(widget.prayerTimes.dhuhr),
//       'العصر': dateFormat.parse(widget.prayerTimes.asr),
//       'المغرب': dateFormat.parse(widget.prayerTimes.maghrib),
//       'العشاء': dateFormat.parse(widget.prayerTimes.isha),
//     };

//     DateTime prayerTime = DateTime(
//       now.year,
//       now.month,
//       now.day,
//       prayerTimes.values.elementAt(index).hour,
//       prayerTimes.values.elementAt(index).minute,
//     );

//     return now.isAfter(prayerTime);
//   }

//   void _showTimeNotReachedDialog(int index) {
//     DateFormat dateFormat = DateFormat('HH:mm');
//     Map<String, DateTime> prayerTimes = {
//       'الفجر': dateFormat.parse(widget.prayerTimes.fajr),
//       'الظهر': dateFormat.parse(widget.prayerTimes.dhuhr),
//       'العصر': dateFormat.parse(widget.prayerTimes.asr),
//       'المغرب': dateFormat.parse(widget.prayerTimes.maghrib),
//       'العشاء': dateFormat.parse(widget.prayerTimes.isha),
//     };

//     DateTime prayerTime = DateTime(
//       DateTime.now().year,
//       DateTime.now().month,
//       DateTime.now().day,
//       prayerTimes.values.elementAt(index).hour,
//       prayerTimes.values.elementAt(index).minute,
//     );

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               const Text(
//                 'تنبيه',
//                 style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           content: Text(
//             'وقت صلاة ${_getFollowPrayerName(index)} لم يحن بعد. الوقت المتبقي هو ${_getRemainingTime(prayerTime)}',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           actions: [
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.brown,
//               ),
//               child: const Text(
//                 'موافق',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   String _getRemainingTime(DateTime prayerTime) {
//     Duration remainingTime = prayerTime.difference(DateTime.now());
//     return '${remainingTime.inHours} ساعة و ${remainingTime.inMinutes % 60} دقيقة';
//   }

//   Future<void> _loadPrayerStatus() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     DateTime now = DateTime.now();
//     String todayDate = DateFormat('yyyy-MM-dd').format(now);

//     for (int i = 0; i < 5; i++) {
//       bool? completed = prefs.getBool('$todayDate-prayer$i');
//       _prayerCompleted[i] = completed ?? false;
//     }
//     _completedCount = _prayerCompleted.where((completed) => completed).length;
//     setState(() {});
//   }

//   Future<void> _savePrayerStatus() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     DateTime now = DateTime.now();
//     String todayDate = DateFormat('yyyy-MM-dd').format(now);

//     for (int i = 0; i < 5; i++) {
//       // 5 prayers
//       prefs.setBool('$todayDate-prayer$i', _prayerCompleted[i]);
//     }
//   }

//   Future<void> _resetDailyStatus() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     DateTime now = DateTime.now();
//     String todayDate = DateFormat('yyyy-MM-dd').format(now);
//     String lastSavedDate = prefs.getString('lastSavedDate') ?? '';

//     if (lastSavedDate != todayDate) {
//       prefs.remove('lastSavedDate');
//       for (int i = 0; i < 5; i++) {
//         prefs.remove('$lastSavedDate-prayer$i');
//       }
//       prefs.setString('lastSavedDate', todayDate); // save prayer
//     }
//   }
// }

// // // import 'package:flutter/material.dart';
// // // import 'package:intl/intl.dart';
// // // import 'package:iqra_app_new_version_22/models/prayer_times_model.dart';

// // // class FollowPrayers extends StatefulWidget {
// // //   final PrayerTimes prayerTimes; // إضافة خاصية لتلقي أوقات الصلاة

// // //   const FollowPrayers({required this.prayerTimes, Key? key}) : super(key: key);

// // //   @override
// // //   _FollowPrayersState createState() => _FollowPrayersState();
// // // }

// // // class _FollowPrayersState extends State<FollowPrayers> {
// // //   List<bool> _prayerCompleted = [false, false, false, false, false];
// // //   int _completedCount = 0;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     // لا نقوم بتحديث حالة الصلاة هنا لأننا نريد التحكم يدويًا
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     double screenHeight = MediaQuery.of(context).size.height;

// // //     return Padding(
// // //       padding: const EdgeInsets.symmetric(horizontal: 15),
// // //       child: Container(
// // //         width: double.infinity,
// // //         height: screenHeight * 0.2,
// // //         decoration: BoxDecoration(
// // //           color: Colors.brown,
// // //           borderRadius: BorderRadius.circular(20),
// // //         ),
// // //         child: Stack(
// // //           alignment: Alignment.center,
// // //           children: [
// // //             const Positioned.fill(
// // //               child: Align(
// // //                 alignment: Alignment.center,
// // //                 child: Divider(
// // //                   thickness: 2,
// // //                   color: Colors.white,
// // //                   indent: 20,
// // //                   endIndent: 20,
// // //                 ),
// // //               ),
// // //             ),
// // //             Column(
// // //               mainAxisAlignment: MainAxisAlignment.center,
// // //               children: [
// // //                 Text(
// // //                   'لقد قمت بأداء $_completedCount / 5 صلوات اليوم',
// // //                   style: const TextStyle(
// // //                     fontSize: 18,
// // //                     color: Colors.white,
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 10),
// // //                 Row(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // //                   children: List.generate(5, (index) {
// // //                     int reversedIndex = 4 - index; // Reverse the index

// // //                     return Expanded(
// // //                       child: Column(
// // //                         mainAxisSize: MainAxisSize.min,
// // //                         children: [
// // //                           IconButton(
// // //                             icon: Icon(
// // //                               _prayerCompleted[reversedIndex]
// // //                                   ? Icons.check_circle
// // //                                   : Icons.check_circle_outline,
// // //                               color: _prayerCompleted[reversedIndex] &&
// // //                                       _isPrayerTimePassed(reversedIndex)
// // //                                   ? Colors.green
// // //                                   : Colors.grey,
// // //                               size: 45,
// // //                             ),
// // //                             onPressed: () {
// // //                               if (_isPrayerTimePassed(reversedIndex)) {
// // //                                 setState(() {
// // //                                   _prayerCompleted[reversedIndex] =
// // //                                       !_prayerCompleted[reversedIndex];
// // //                                   _completedCount = _prayerCompleted
// // //                                       .where((completed) => completed)
// // //                                       .length;
// // //                                 });
// // //                               } else {
// // //                                 _showTimeNotReachedDialog(index);
// // //                               }
// // //                             },
// // //                           ),
// // //                           const SizedBox(height: 10),
// // //                           Text(
// // //                             _getFollowPrayerName(index),
// // //                             style: const TextStyle(
// // //                               color: Colors.white,
// // //                               fontSize: 18,
// // //                               fontWeight: FontWeight.bold,
// // //                             ),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     );
// // //                   }),
// // //                 ),
// // //               ],
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   String _getFollowPrayerName(int index) {
// // //     const prayers = ['العشاء', 'المغرب', 'العصر', 'الظهر', 'الفجر'];
// // //     return prayers[index];
// // //   }

// // //   bool _isPrayerTimePassed(int index) {
// // //     DateTime now = DateTime.now();
// // //     DateFormat dateFormat = DateFormat('HH:mm');
// // //     Map<String, DateTime> prayerTimes = {
// // //       'الفجر': dateFormat.parse(widget.prayerTimes.fajr),
// // //       'الظهر': dateFormat.parse(widget.prayerTimes.dhuhr),
// // //       'العصر': dateFormat.parse(widget.prayerTimes.asr),
// // //       'المغرب': dateFormat.parse(widget.prayerTimes.maghrib),
// // //       'العشاء': dateFormat.parse(widget.prayerTimes.isha),
// // //     };

// // //     DateTime prayerTime = DateTime(
// // //       now.year,
// // //       now.month,
// // //       now.day,
// // //       prayerTimes.values.elementAt(index).hour,
// // //       prayerTimes.values.elementAt(index).minute,
// // //     );

// // //     return now.isAfter(prayerTime);
// // //   }

// // //   void _showTimeNotReachedDialog(int index) {
// // //     DateFormat dateFormat = DateFormat('HH:mm');
// // //     Map<String, DateTime> prayerTimes = {
// // //       'الفجر': dateFormat.parse(widget.prayerTimes.fajr),
// // //       'الظهر': dateFormat.parse(widget.prayerTimes.dhuhr),
// // //       'العصر': dateFormat.parse(widget.prayerTimes.asr),
// // //       'المغرب': dateFormat.parse(widget.prayerTimes.maghrib),
// // //       'العشاء': dateFormat.parse(widget.prayerTimes.isha),
// // //     };

// // //     DateTime prayerTime = DateTime(
// // //       DateTime.now().year,
// // //       DateTime.now().month,
// // //       DateTime.now().day,
// // //       prayerTimes.values.elementAt(index).hour,
// // //       prayerTimes.values.elementAt(index).minute,
// // //     );

// // //     showDialog(
// // //       context: context,
// // //       builder: (BuildContext context) {
// // //         return AlertDialog(
// // //           title: const Text('تنبيه'),
// // //           content: Text(
// // //               'وقت صلاة ${_getFollowPrayerName(index)} لم يحن بعد. الوقت المتبقي هو ${_getRemainingTime(prayerTime)}'),
// // //           actions: [
// // //             TextButton(
// // //               child: const Text('موافق'),
// // //               onPressed: () {
// // //                 Navigator.of(context).pop();
// // //               },
// // //             ),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }

// // //   String _getRemainingTime(DateTime prayerTime) {
// // //     Duration remainingTime = prayerTime.difference(DateTime.now());
// // //     return '${remainingTime.inHours} ساعة و ${remainingTime.inMinutes % 60} دقيقة';
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'package:iqra_app_new_version_22/models/prayer_times_model.dart';

// // class FollowPrayers extends StatefulWidget {
// //   final PrayerTimes prayerTimes; // إضافة خاصية لتلقي أوقات الصلاة

// //   const FollowPrayers({required this.prayerTimes, Key? key}) : super(key: key);

// //   @override
// //   _FollowPrayersState createState() => _FollowPrayersState();
// // }

// // class _FollowPrayersState extends State<FollowPrayers> {
// //   List<bool> _prayerCompleted = [false, false, false, false, false];
// //   int _completedCount = 0;

// //   @override
// //   void initState() {
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     double screenHeight = MediaQuery.of(context).size.height;

// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 15),
// //       child: Container(
// //         width: double.infinity,
// //         height: screenHeight * 0.2,
// //         decoration: BoxDecoration(
// //           color: Colors.brown,
// //           borderRadius: BorderRadius.circular(20),
// //         ),
// //         child: Stack(
// //           alignment: Alignment.center,
// //           children: [
// //             const Positioned.fill(
// //               child: Align(
// //                 alignment: Alignment.center,
// //                 child: Divider(
// //                   thickness: 2,
// //                   color: Colors.white,
// //                   indent: 20,
// //                   endIndent: 20,
// //                 ),
// //               ),
// //             ),
// //             Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Text(
// //                   'لقد قمت بأداء $_completedCount / 5 صلوات اليوم',
// //                   style: const TextStyle(
// //                     fontSize: 18,
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 10),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                   children: List.generate(5, (index) {
// //                     int reversedIndex = 4 - index; // Reverse the index

// //                     return Expanded(
// //                       child: Column(
// //                         mainAxisSize: MainAxisSize.min,
// //                         children: [
// //                           IconButton(
// //                             icon: Icon(
// //                               _prayerCompleted[reversedIndex]
// //                                   ? Icons.check_circle
// //                                   : Icons.check_circle_outline,
// //                               color: _prayerCompleted[reversedIndex] &&
// //                                       _isPrayerTimePassed(reversedIndex)
// //                                   ? Colors.green
// //                                   : Colors.grey,
// //                               size: 45,
// //                             ),
// //                             onPressed: () {
// //                               if (_isPrayerTimePassed(reversedIndex)) {
// //                                 setState(() {
// //                                   _prayerCompleted[reversedIndex] =
// //                                       !_prayerCompleted[reversedIndex];
// //                                   _completedCount = _prayerCompleted
// //                                       .where((completed) => completed)
// //                                       .length;
// //                                 });
// //                               } else {
// //                                 _showTimeNotReachedDialog(reversedIndex);
// //                               }
// //                             },
// //                           ),
// //                           const SizedBox(height: 10),
// //                           Text(
// //                             _getFollowPrayerName(reversedIndex),
// //                             style: const TextStyle(
// //                               color: Colors.white,
// //                               fontSize: 18,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     );
// //                   }),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   String _getFollowPrayerName(int index) {
// //     const prayers = ['العشاء', 'المغرب', 'العصر', 'الظهر', 'الفجر'];
// //     return prayers[index];
// //   }

// //   bool _isPrayerTimePassed(int index) {
// //     DateTime now = DateTime.now();
// //     DateFormat dateFormat = DateFormat('HH:mm');
// //     Map<String, DateTime> prayerTimes = {
// //       'الفجر': dateFormat.parse(widget.prayerTimes.fajr),
// //       'الظهر': dateFormat.parse(widget.prayerTimes.dhuhr),
// //       'العصر': dateFormat.parse(widget.prayerTimes.asr),
// //       'المغرب': dateFormat.parse(widget.prayerTimes.maghrib),
// //       'العشاء': dateFormat.parse(widget.prayerTimes.isha),
// //     };

// //     DateTime prayerTime = DateTime(
// //       now.year,
// //       now.month,
// //       now.day,
// //       prayerTimes.values.elementAt(index).hour,
// //       prayerTimes.values.elementAt(index).minute,
// //     );

// //     return now.isAfter(prayerTime);
// //   }

// //   void _showTimeNotReachedDialog(int index) {
// //     DateFormat dateFormat = DateFormat('HH:mm');
// //     Map<String, DateTime> prayerTimes = {
// //       'الفجر': dateFormat.parse(widget.prayerTimes.fajr),
// //       'الظهر': dateFormat.parse(widget.prayerTimes.dhuhr),
// //       'العصر': dateFormat.parse(widget.prayerTimes.asr),
// //       'المغرب': dateFormat.parse(widget.prayerTimes.maghrib),
// //       'العشاء': dateFormat.parse(widget.prayerTimes.isha),
// //     };

// //     DateTime prayerTime = DateTime(
// //       DateTime.now().year,
// //       DateTime.now().month,
// //       DateTime.now().day,
// //       prayerTimes.values.elementAt(index).hour,
// //       prayerTimes.values.elementAt(index).minute,
// //     );

// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: const Text('تنبيه'),
// //           content: Text(
// //               'وقت صلاة ${_getFollowPrayerName(index)} لم يحن بعد. الوقت المتبقي هو ${_getRemainingTime(prayerTime)}'),
// //           actions: [
// //             TextButton(
// //               child: const Text('موافق'),
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   String _getRemainingTime(DateTime prayerTime) {
// //     Duration remainingTime = prayerTime.difference(DateTime.now());
// //     // إضافة صفر قبل الأرقام المفردة
// //     String hours = remainingTime.inHours.toString().padLeft(2, '0');
// //     String minutes = (remainingTime.inMinutes % 60).toString().padLeft(2, '0');
// //     return '$hours ساعة و $minutes دقيقة';
// //   }
// // }

// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'package:iqra_app_new_version_22/models/prayer_times_model.dart';

// // class FollowPrayers extends StatefulWidget {
// //   final PrayerTimes prayerTimes; // إضافة خاصية لتلقي أوقات الصلاة

// //   const FollowPrayers({required this.prayerTimes, Key? key}) : super(key: key);

// //   @override
// //   _FollowPrayersState createState() => _FollowPrayersState();
// // }

// // class _FollowPrayersState extends State<FollowPrayers> {
// //   List<bool> _prayerCompleted = [false, false, false, false, false];
// //   int _completedCount = 0;

// //   @override
// //   void initState() {
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     double screenHeight = MediaQuery.of(context).size.height;

// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 15),
// //       child: Container(
// //         width: double.infinity,
// //         height: screenHeight * 0.2,
// //         decoration: BoxDecoration(
// //           color: Colors.brown,
// //           borderRadius: BorderRadius.circular(20),
// //         ),
// //         child: Stack(
// //           alignment: Alignment.center,
// //           children: [
// //             const Positioned.fill(
// //               child: Align(
// //                 alignment: Alignment.center,
// //                 child: Divider(
// //                   thickness: 2,
// //                   color: Colors.white,
// //                   indent: 20,
// //                   endIndent: 20,
// //                 ),
// //               ),
// //             ),
// //             Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Text(
// //                   'لقد قمت بأداء $_completedCount / 5 صلوات اليوم',
// //                   style: const TextStyle(
// //                     fontSize: 18,
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 10),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                   children: List.generate(5, (index) {
// //                     int prayerIndex =
// //                         (4 - index) % 5; // Reverse the index for display

// //                     return Expanded(
// //                       child: Column(
// //                         mainAxisSize: MainAxisSize.min,
// //                         children: [
// //                           IconButton(
// //                             icon: Icon(
// //                               _prayerCompleted[prayerIndex]
// //                                   ? Icons.check_circle
// //                                   : Icons.check_circle_outline,
// //                               color: _prayerCompleted[prayerIndex] &&
// //                                       _isPrayerTimePassed(prayerIndex)
// //                                   ? Colors.green
// //                                   : Colors.grey,
// //                               size: 45,
// //                             ),
// //                             onPressed: () {
// //                               if (_isPrayerTimePassed(prayerIndex)) {
// //                                 setState(() {
// //                                   _prayerCompleted[prayerIndex] =
// //                                       !_prayerCompleted[prayerIndex];
// //                                   _completedCount = _prayerCompleted
// //                                       .where((completed) => completed)
// //                                       .length;
// //                                 });
// //                               } else {
// //                                 _showTimeNotReachedDialog(prayerIndex);
// //                               }
// //                             },
// //                           ),
// //                           const SizedBox(height: 10),
// //                           Text(
// //                             _getFollowPrayerName(prayerIndex),
// //                             style: const TextStyle(
// //                               color: Colors.white,
// //                               fontSize: 18,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     );
// //                   }),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   String _getFollowPrayerName(int index) {
// //     const prayers = ['الفجر', 'الظهر', 'العصر', 'المغرب', 'العشاء'];
// //     return prayers[index];
// //   }

// //   bool _isPrayerTimePassed(int index) {
// //     DateTime now = DateTime.now();
// //     DateFormat dateFormat = DateFormat('HH:mm');
// //     Map<String, DateTime> prayerTimes = {
// //       'الفجر': dateFormat.parse(widget.prayerTimes.fajr),
// //       'الظهر': dateFormat.parse(widget.prayerTimes.dhuhr),
// //       'العصر': dateFormat.parse(widget.prayerTimes.asr),
// //       'المغرب': dateFormat.parse(widget.prayerTimes.maghrib),
// //       'العشاء': dateFormat.parse(widget.prayerTimes.isha),
// //     };

// //     DateTime prayerTime = DateTime(
// //       now.year,
// //       now.month,
// //       now.day,
// //       prayerTimes.values.elementAt(index).hour,
// //       prayerTimes.values.elementAt(index).minute,
// //     );

// //     return now.isAfter(prayerTime);
// //   }

// //   void _showTimeNotReachedDialog(int index) {
// //     DateFormat dateFormat = DateFormat('HH:mm');
// //     Map<String, DateTime> prayerTimes = {
// //       'الفجر': dateFormat.parse(widget.prayerTimes.fajr),
// //       'الظهر': dateFormat.parse(widget.prayerTimes.dhuhr),
// //       'العصر': dateFormat.parse(widget.prayerTimes.asr),
// //       'المغرب': dateFormat.parse(widget.prayerTimes.maghrib),
// //       'العشاء': dateFormat.parse(widget.prayerTimes.isha),
// //     };

// //     DateTime prayerTime = DateTime(
// //       DateTime.now().year,
// //       DateTime.now().month,
// //       DateTime.now().day,
// //       prayerTimes.values.elementAt(index).hour,
// //       prayerTimes.values.elementAt(index).minute,
// //     );

// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: const Row(
// //             mainAxisAlignment: MainAxisAlignment.end,
// //             children: [
// //               Text(
// //                 'تنبيه',
// //                 style: TextStyle(
// //                   fontSize: 28,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //             ],
// //           ),
// //           content: Text(
// //             textAlign: TextAlign.center,
// //             'وقت صلاة ${_getFollowPrayerName(index)} لم يحن بعد. الوقت المتبقي هو ${_getRemainingTime(prayerTime)}',
// //             style: const TextStyle(
// //               fontSize: 20,
// //             ),
// //           ),
// //           actions: [
// //             ElevatedButton(
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: Colors.brown,
// //               ),
// //               child: const Text(
// //                 'موافق',
// //                 style: TextStyle(
// //                   fontSize: 20,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.white,
// //                 ),
// //               ),
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   String _getRemainingTime(DateTime prayerTime) {
// //     Duration remainingTime = prayerTime.difference(DateTime.now());
// //     // إضافة صفر قبل الأرقام المفردة
// //     String hours = remainingTime.inHours.toString().padLeft(2, '.');
// //     String minutes = (remainingTime.inMinutes % 60).toString().padLeft(2, '0');
// //     return '$hours ساعة و $minutes دقيقة';
// //   }
// // }

// ////////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart'; // أضف هذه الاستيراد
// import 'package:iqra_app_new_version_22/models/prayer_times_model.dart';

// class FollowPrayers extends StatefulWidget {
//   final PrayerTimes prayerTimes;

//   const FollowPrayers({required this.prayerTimes, Key? key}) : super(key: key);

//   @override
//   _FollowPrayersState createState() => _FollowPrayersState();
// }

// class _FollowPrayersState extends State<FollowPrayers> {
//   List<bool> _prayerCompleted = [false, false, false, false, false];
//   int _completedCount = 0;

//   @override
//   void initState() {
//     super.initState();
//     _loadPrayerStatus();
//   }

//   Future<void> _loadPrayerStatus() async {
//     final prefs = await SharedPreferences.getInstance();
//     final todayKey = DateFormat('yyyyMMdd').format(DateTime.now());
//     final savedStatus = prefs.getString(todayKey);

//     if (savedStatus != null) {
//       final statusList =
//           savedStatus.split(',').map((e) => e == 'true').toList();
//       setState(() {
//         _prayerCompleted = statusList;
//         _completedCount =
//             _prayerCompleted.where((completed) => completed).length;
//       });
//     }
//   }

//   Future<void> _savePrayerStatus() async {
//     final prefs = await SharedPreferences.getInstance();
//     final todayKey = DateFormat('yyyyMMdd').format(DateTime.now());
//     final statusString = _prayerCompleted.map((e) => e.toString()).join(',');
//     await prefs.setString(todayKey, statusString);
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       child: Container(
//         width: double.infinity,
//         height: screenHeight * 0.2,
//         decoration: BoxDecoration(
//           color: Colors.brown,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             const Positioned.fill(
//               child: Align(
//                 alignment: Alignment.center,
//                 child: Divider(
//                   thickness: 2,
//                   color: Colors.white,
//                   indent: 20,
//                   endIndent: 20,
//                 ),
//               ),
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'لقد قمت بأداء $_completedCount / 5 صلوات اليوم',
//                   style: const TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: List.generate(5, (index) {
//                     int prayerIndex =
//                         (4 - index) % 5; // Reverse the index for display

//                     return Expanded(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             icon: Icon(
//                               _prayerCompleted[prayerIndex]
//                                   ? Icons.check_circle
//                                   : Icons.check_circle_outline,
//                               color: _prayerCompleted[prayerIndex] &&
//                                       _isPrayerTimePassed(prayerIndex)
//                                   ? Colors.green
//                                   : Colors.grey,
//                               size: 45,
//                             ),
//                             onPressed: () {
//                               if (_isPrayerTimePassed(prayerIndex)) {
//                                 setState(() {
//                                   _prayerCompleted[prayerIndex] =
//                                       !_prayerCompleted[prayerIndex];
//                                   _completedCount = _prayerCompleted
//                                       .where((completed) => completed)
//                                       .length;
//                                   _savePrayerStatus(); // Save the updated status
//                                 });
//                               } else {
//                                 _showTimeNotReachedDialog(prayerIndex);
//                               }
//                             },
//                           ),
//                           const SizedBox(height: 10),
//                           Text(
//                             _getFollowPrayerName(prayerIndex),
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   }),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   String _getFollowPrayerName(int index) {
//     const prayers = ['الفجر', 'الظهر', 'العصر', 'المغرب', 'العشاء'];
//     return prayers[index];
//   }

//   bool _isPrayerTimePassed(int index) {
//     DateTime now = DateTime.now();
//     DateFormat dateFormat = DateFormat('HH:mm');
//     Map<String, DateTime> prayerTimes = {
//       'الفجر': dateFormat.parse(widget.prayerTimes.fajr),
//       'الظهر': dateFormat.parse(widget.prayerTimes.dhuhr),
//       'العصر': dateFormat.parse(widget.prayerTimes.asr),
//       'المغرب': dateFormat.parse(widget.prayerTimes.maghrib),
//       'العشاء': dateFormat.parse(widget.prayerTimes.isha),
//     };

//     DateTime prayerTime = DateTime(
//       now.year,
//       now.month,
//       now.day,
//       prayerTimes.values.elementAt(index).hour,
//       prayerTimes.values.elementAt(index).minute,
//     );

//     return now.isAfter(prayerTime);
//   }

//   void _showTimeNotReachedDialog(int index) {
//     DateFormat dateFormat = DateFormat('HH:mm');
//     Map<String, DateTime> prayerTimes = {
//       'الفجر': dateFormat.parse(widget.prayerTimes.fajr),
//       'الظهر': dateFormat.parse(widget.prayerTimes.dhuhr),
//       'العصر': dateFormat.parse(widget.prayerTimes.asr),
//       'المغرب': dateFormat.parse(widget.prayerTimes.maghrib),
//       'العشاء': dateFormat.parse(widget.prayerTimes.isha),
//     };

//     DateTime prayerTime = DateTime(
//       DateTime.now().year,
//       DateTime.now().month,
//       DateTime.now().day,
//       prayerTimes.values.elementAt(index).hour,
//       prayerTimes.values.elementAt(index).minute,
//     );

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Text(
//                 'تنبيه',
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           content: Text(
//             textAlign: TextAlign.center,
//             'وقت صلاة ${_getFollowPrayerName(index)} لم يحن بعد. الوقت المتبقي هو ${_getRemainingTime(prayerTime)}',
//             style: const TextStyle(
//               fontSize: 20,
//             ),
//           ),
//           actions: [
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.brown,
//               ),
//               child: const Text(
//                 'موافق',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   String _getRemainingTime(DateTime prayerTime) {
//     Duration remainingTime = prayerTime.difference(DateTime.now());
//     String hours = remainingTime.inHours.toString().padLeft(2, '0');
//     String minutes = (remainingTime.inMinutes % 60).toString().padLeft(2, '0');
//     return '$hours ساعة و $minutes دقيقة';
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart'; // أضف هذه الاستيراد
import 'package:iqra_app_new_version_22/models/prayer_times_model.dart';

class FollowPrayers extends StatefulWidget {
  final PrayerTimes prayerTimes;

  const FollowPrayers({required this.prayerTimes, Key? key}) : super(key: key);

  @override
  _FollowPrayersState createState() => _FollowPrayersState();
}

class _FollowPrayersState extends State<FollowPrayers> {
  List<bool> _prayerCompleted = [false, false, false, false, false];
  int _completedCount = 0;

  @override
  void initState() {
    super.initState();
    _loadPrayerStatus();
  }

  Future<void> _loadPrayerStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final todayKey = DateFormat('yyyyMMdd').format(DateTime.now());
    final lastSavedDate = prefs.getString('lastSavedDate') ?? '';

    // Check if the saved date is today
    if (lastSavedDate != todayKey) {
      // Reset the prayer status for a new day
      setState(() {
        _prayerCompleted = [false, false, false, false, false];
        _completedCount = 0;
      });
      // Save the reset status
      await _savePrayerStatus();
    } else {
      // Load the saved status
      final savedStatus = prefs.getString(todayKey);
      if (savedStatus != null) {
        final statusList =
            savedStatus.split(',').map((e) => e == 'true').toList();
        setState(() {
          _prayerCompleted = statusList;
          _completedCount =
              _prayerCompleted.where((completed) => completed).length;
        });
      }
    }
    // Update the last saved date
    await prefs.setString('lastSavedDate', todayKey);
  }

  Future<void> _savePrayerStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final todayKey = DateFormat('yyyyMMdd').format(DateTime.now());
    final statusString = _prayerCompleted.map((e) => e.toString()).join(',');
    await prefs.setString(todayKey, statusString);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.2,
        decoration: BoxDecoration(
          color: Colors.brown,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Divider(
                  thickness: 2,
                  color: Colors.white,
                  indent: 20,
                  endIndent: 20,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'لقد قمت بأداء $_completedCount / 5 صلوات اليوم',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(5, (index) {
                    int prayerIndex =
                        (4 - index) % 5; // Reverse the index for display

                    return Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              _prayerCompleted[prayerIndex]
                                  ? Icons.check_circle
                                  : Icons.check_circle_outline,
                              color: _prayerCompleted[prayerIndex] &&
                                      _isPrayerTimePassed(prayerIndex)
                                  ? Colors.green
                                  : Colors.grey,
                              size: 45,
                            ),
                            onPressed: () {
                              if (_isPrayerTimePassed(prayerIndex)) {
                                setState(() {
                                  _prayerCompleted[prayerIndex] =
                                      !_prayerCompleted[prayerIndex];
                                  _completedCount = _prayerCompleted
                                      .where((completed) => completed)
                                      .length;
                                  _savePrayerStatus(); // Save the updated status
                                });
                              } else {
                                _showTimeNotReachedDialog(prayerIndex);
                              }
                            },
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _getFollowPrayerName(prayerIndex),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getFollowPrayerName(int index) {
    const prayers = ['الفجر', 'الظهر', 'العصر', 'المغرب', 'العشاء'];
    return prayers[index];
  }

  bool _isPrayerTimePassed(int index) {
    DateTime now = DateTime.now();
    DateFormat dateFormat = DateFormat('HH:mm');
    Map<String, DateTime> prayerTimes = {
      'الفجر': dateFormat.parse(widget.prayerTimes.fajr),
      'الظهر': dateFormat.parse(widget.prayerTimes.dhuhr),
      'العصر': dateFormat.parse(widget.prayerTimes.asr),
      'المغرب': dateFormat.parse(widget.prayerTimes.maghrib),
      'العشاء': dateFormat.parse(widget.prayerTimes.isha),
    };

    DateTime prayerTime = DateTime(
      now.year,
      now.month,
      now.day,
      prayerTimes.values.elementAt(index).hour,
      prayerTimes.values.elementAt(index).minute,
    );

    return now.isAfter(prayerTime);
  }

  void _showTimeNotReachedDialog(int index) {
    DateFormat dateFormat = DateFormat('HH:mm');
    Map<String, DateTime> prayerTimes = {
      'الفجر': dateFormat.parse(widget.prayerTimes.fajr),
      'الظهر': dateFormat.parse(widget.prayerTimes.dhuhr),
      'العصر': dateFormat.parse(widget.prayerTimes.asr),
      'المغرب': dateFormat.parse(widget.prayerTimes.maghrib),
      'العشاء': dateFormat.parse(widget.prayerTimes.isha),
    };

    DateTime prayerTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      prayerTimes.values.elementAt(index).hour,
      prayerTimes.values.elementAt(index).minute,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'تنبيه',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Text(
            textAlign: TextAlign.center,
            'وقت صلاة ${_getFollowPrayerName(index)} لم يحن بعد. الوقت المتبقي هو ${_getRemainingTime(prayerTime)}',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
              ),
              child: const Text(
                'موافق',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // String _getRemainingTime(DateTime prayerTime) {
  //   Duration remainingTime = prayerTime.difference(DateTime.now());
  //   String hours = remainingTime.inHours.toString().padLeft(2, '0');
  //   String minutes = (remainingTime.inMinutes % 60).toString().padLeft(2, '0');
  //   return '$hours ساعة و $minutes دقيقة';
  // }

  String _getRemainingTime(DateTime prayerTime) {
    Duration remainingTime = prayerTime.difference(DateTime.now());
    String hours = _convertToArabicNumerals(
        remainingTime.inHours.toString().padLeft(2, '0'));
    String minutes = _convertToArabicNumerals(
        (remainingTime.inMinutes % 60).toString().padLeft(2, '0'));
    return '$hours ساعة و $minutes دقيقة';
  }

  String _convertToArabicNumerals(String input) {
    const arabicNumerals = '٠١٢٣٤٥٦٧٨٩';
    return input.split('').map((char) {
      if (char.contains(RegExp(r'[0-9]'))) {
        return arabicNumerals[int.parse(char)];
      }
      return char;
    }).join('');
  }
}
