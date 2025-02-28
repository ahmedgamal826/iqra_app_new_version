// // // import 'package:flutter/material.dart';
// // // import 'package:adhan/adhan.dart';
// // // import 'package:audioplayers/audioplayers.dart';
// // // import 'dart:async';

// // // class AdhanPage extends StatefulWidget {
// // //   @override
// // //   _AdhanPageState createState() => _AdhanPageState();
// // // }

// // // class _AdhanPageState extends State<AdhanPage> {
// // //   late PrayerTimes prayerTimes;
// // //   late Timer _timer;
// // //   final player = AudioPlayer();

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _calculatePrayerTimes();
// // //     _startPrayerCheck();
// // //   }

// // //   void _calculatePrayerTimes() {
// // //     final coordinates = Coordinates(30.0444, 31.2357); // إحداثيات القاهرة كمثال
// // //     final params = CalculationMethod.egyptian.getParameters();
// // //     prayerTimes = PrayerTimes.today(coordinates, params);
// // //   }

// // //   void _startPrayerCheck() {
// // //     _timer = Timer.periodic(Duration(minutes: 1), (timer) {
// // //       _checkPrayerTime();
// // //     });
// // //   }

// // //   void _checkPrayerTime() {
// // //     final now = TimeOfDay.now();
// // //     if (_isTimeForAdhan(now)) {
// // //       _playAdhan();
// // //     }
// // //   }

// // //   bool _isTimeForAdhan(TimeOfDay now) {
// // //     List<TimeOfDay> times = [
// // //       _convertDateTimeToTimeOfDay(prayerTimes.fajr),
// // //       _convertDateTimeToTimeOfDay(prayerTimes.dhuhr),
// // //       _convertDateTimeToTimeOfDay(prayerTimes.asr),
// // //       _convertDateTimeToTimeOfDay(prayerTimes.maghrib),
// // //       _convertDateTimeToTimeOfDay(prayerTimes.isha),
// // //     ];
// // //     return times
// // //         .any((time) => time.hour == now.hour && time.minute == now.minute);
// // //   }

// // //   TimeOfDay _convertDateTimeToTimeOfDay(DateTime time) {
// // //     return TimeOfDay(hour: time.hour, minute: time.minute);
// // //   }

// // //   void _playAdhan() async {
// // //     await player.play(AssetSource('adhan.mp3'));
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _timer.cancel();
// // //     player.dispose();
// // //     super.dispose();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(title: Text("أوقات الصلاة")),
// // //       body: Center(
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             Text("الفجر: ${prayerTimes.fajr.hour}:${prayerTimes.fajr.minute}"),
// // //             Text(
// // //                 "الظهر: ${prayerTimes.dhuhr.hour}:${prayerTimes.dhuhr.minute}"),
// // //             Text("العصر: ${prayerTimes.asr.hour}:${prayerTimes.asr.minute}"),
// // //             Text(
// // //                 "المغرب: ${prayerTimes.maghrib.hour}:${prayerTimes.maghrib.minute}"),
// // //             Text("العشاء: ${prayerTimes.isha.hour}:${prayerTimes.isha.minute}"),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:adhan/adhan.dart';
// // import 'package:audioplayers/audioplayers.dart';
// // import 'package:intl/intl.dart';
// // import 'dart:async';

// // class AdhanPage extends StatefulWidget {
// //   @override
// //   _AdhanPageState createState() => _AdhanPageState();
// // }

// // class _AdhanPageState extends State<AdhanPage> {
// //   late PrayerTimes prayerTimes;
// //   late Timer _timer;
// //   final player = AudioPlayer();
// //   String nextPrayer = "";
// //   Duration timeRemaining = Duration.zero;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _calculatePrayerTimes();
// //     _startPrayerCheck();
// //   }

// //   void _calculatePrayerTimes() {
// //     final coordinates = Coordinates(30.0444, 31.2357); // إحداثيات القاهرة
// //     final params = CalculationMethod.egyptian.getParameters();
// //     prayerTimes = PrayerTimes.today(coordinates, params);
// //     _updateNextPrayer();
// //   }

// //   void _startPrayerCheck() {
// //     _timer = Timer.periodic(Duration(seconds: 30), (timer) {
// //       _updateNextPrayer();
// //       _checkPrayerTime();
// //     });
// //   }

// //   void _checkPrayerTime() {
// //     final now = TimeOfDay.now();
// //     if (_isTimeForAdhan(now)) {
// //       _playAdhan();
// //     }
// //   }

// //   bool _isTimeForAdhan(TimeOfDay now) {
// //     List<TimeOfDay> times = [
// //       _convertDateTimeToTimeOfDay(prayerTimes.fajr),
// //       _convertDateTimeToTimeOfDay(prayerTimes.dhuhr),
// //       _convertDateTimeToTimeOfDay(prayerTimes.asr),
// //       _convertDateTimeToTimeOfDay(prayerTimes.maghrib),
// //       _convertDateTimeToTimeOfDay(prayerTimes.isha),
// //     ];
// //     return times
// //         .any((time) => time.hour == now.hour && time.minute == now.minute);
// //   }

// //   void _updateNextPrayer() {
// //     final now = DateTime.now();
// //     final prayers = {
// //       "الفجر": prayerTimes.fajr,
// //       "الظهر": prayerTimes.dhuhr,
// //       "العصر": prayerTimes.asr,
// //       "المغرب": prayerTimes.maghrib,
// //       "العشاء": prayerTimes.isha,
// //     };

// //     for (var entry in prayers.entries) {
// //       if (entry.value.isAfter(now)) {
// //         setState(() {
// //           nextPrayer = entry.key;
// //           timeRemaining = entry.value.difference(now);
// //         });
// //         break;
// //       }
// //     }
// //   }

// //   TimeOfDay _convertDateTimeToTimeOfDay(DateTime time) {
// //     return TimeOfDay(hour: time.hour, minute: time.minute);
// //   }

// //   void _playAdhan() async {
// //     await player.play(AssetSource('assets/audios/adhan.mp3'));
// //   }

// //   @override
// //   void dispose() {
// //     _timer.cancel();
// //     player.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final todayDate = DateTime.now();
// //     final formattedDate =
// //         DateFormat('EEEE, dd MMMM yyyy', 'ar').format(todayDate);

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("أوقات الصلاة"),
// //         backgroundColor: Colors.green[700],
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             // عرض التاريخ الميلادي
// //             Card(
// //               color: Colors.green[100],
// //               shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(15)),
// //               child: Padding(
// //                 padding: const EdgeInsets.all(12.0),
// //                 child: Text(
// //                   "📆 التاريخ الميلادي: $formattedDate",
// //                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 10),

// //             // الصلاة القادمة
// //             Card(
// //               color: Colors.green[300],
// //               shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(15)),
// //               child: ListTile(
// //                 leading: Icon(Icons.access_time, color: Colors.white),
// //                 title: Text(
// //                   "الصلاة القادمة: $nextPrayer",
// //                   style: TextStyle(
// //                       color: Colors.white, fontWeight: FontWeight.bold),
// //                 ),
// //                 subtitle: Text(
// //                   "الوقت المتبقي: ${timeRemaining.inHours} ساعة و ${timeRemaining.inMinutes % 60} دقيقة",
// //                   style: TextStyle(color: Colors.white),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 10),

// //             // قائمة الصلوات
// //             Expanded(
// //               child: ListView(
// //                 children: [
// //                   _buildPrayerCard(
// //                       "الفجر", prayerTimes.fajr, Icons.wb_twighlight),
// //                   _buildPrayerCard("الظهر", prayerTimes.dhuhr, Icons.wb_sunny),
// //                   _buildPrayerCard("العصر", prayerTimes.asr, Icons.wb_cloudy),
// //                   _buildPrayerCard(
// //                       "المغرب", prayerTimes.maghrib, Icons.nightlight_round),
// //                   _buildPrayerCard(
// //                       "العشاء", prayerTimes.isha, Icons.brightness_3),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildPrayerCard(String name, DateTime time, IconData icon) {
// //     return Card(
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
// //       elevation: 3,
// //       child: ListTile(
// //         leading: Icon(icon, color: Colors.green[700]),
// //         title: Text(
// //           name,
// //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //         ),
// //         trailing: Text(
// //           "${time.hour}:${time.minute.toString().padLeft(2, '0')}",
// //           style: TextStyle(
// //               fontSize: 16,
// //               fontWeight: FontWeight.bold,
// //               color: Colors.green[700]),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:adhan/adhan.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:intl/intl.dart';
// import 'dart:async';

// class AdhanPage extends StatefulWidget {
//   @override
//   _AdhanPageState createState() => _AdhanPageState();
// }

// class _AdhanPageState extends State<AdhanPage> {
//   late PrayerTimes prayerTimes;
//   late Timer _timer;
//   final player = AudioPlayer();
//   String nextPrayer = "";
//   Duration timeRemaining = Duration.zero;
//   String selectedCountry = "مصر";
//   String selectedCity = "القاهرة";

//   final Map<String, Coordinates> locations = {
//     "مصر ; القاهرة": Coordinates(30.0444, 31.2357),
//     "السعودية ; الرياض": Coordinates(24.7136, 46.6753),
//     "الإمارات ; دبي": Coordinates(25.276987, 55.296249),
//     "تركيا ; إسطنبول": Coordinates(41.0082, 28.9784),
//   };

//   @override
//   void initState() {
//     super.initState();
//     _calculatePrayerTimes();
//     _startPrayerCheck();
//   }

//   void _calculatePrayerTimes() {
//     final coordinates = locations["$selectedCountry ; $selectedCity"] ??
//         Coordinates(30.0444, 31.2357);
//     final params = CalculationMethod.egyptian.getParameters();
//     prayerTimes = PrayerTimes.today(coordinates, params);
//     _updateNextPrayer();
//   }

//   void _startPrayerCheck() {
//     _timer = Timer.periodic(Duration(seconds: 30), (timer) {
//       _updateNextPrayer();
//       _checkPrayerTime();
//     });
//   }

//   void _checkPrayerTime() {
//     final now = TimeOfDay.now();
//     if (_isTimeForAdhan(now)) {
//       _playAdhan();
//     }
//   }

//   bool _isTimeForAdhan(TimeOfDay now) {
//     List<TimeOfDay> times = [
//       _convertDateTimeToTimeOfDay(prayerTimes.fajr),
//       _convertDateTimeToTimeOfDay(prayerTimes.dhuhr),
//       _convertDateTimeToTimeOfDay(prayerTimes.asr),
//       _convertDateTimeToTimeOfDay(prayerTimes.maghrib),
//       _convertDateTimeToTimeOfDay(prayerTimes.isha),
//     ];
//     return times
//         .any((time) => time.hour == now.hour && time.minute == now.minute);
//   }

//   void _updateNextPrayer() {
//     final now = DateTime.now();
//     final prayers = {
//       "الفجر": prayerTimes.fajr,
//       "الظهر": prayerTimes.dhuhr,
//       "العصر": prayerTimes.asr,
//       "المغرب": prayerTimes.maghrib,
//       "العشاء": prayerTimes.isha,
//     };

//     for (var entry in prayers.entries) {
//       if (entry.value.isAfter(now)) {
//         setState(() {
//           nextPrayer = entry.key;
//           timeRemaining = entry.value.difference(now);
//         });
//         break;
//       }
//     }
//   }

//   TimeOfDay _convertDateTimeToTimeOfDay(DateTime time) {
//     return TimeOfDay(hour: time.hour, minute: time.minute);
//   }

//   void _playAdhan() async {
//     await player.play(AssetSource('assets/audios/adhan.mp3'));
//   }

//   void _changeLocation(String country, String city) {
//     setState(() {
//       selectedCountry = country;
//       selectedCity = city;
//     });
//     _calculatePrayerTimes();
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     player.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final todayDate = DateTime.now();
//     final formattedDate =
//         DateFormat('EEEE, dd MMMM yyyy', 'ar').format(todayDate);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("أوقات الصلاة"),
//         backgroundColor: Colors.green[700],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Card(
//               color: Colors.green[100],
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15)),
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Text(
//                   "📆 التاريخ الميلادي: $formattedDate",
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             Card(
//               color: Colors.green[300],
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15)),
//               child: ListTile(
//                 leading: IconButton(
//                   icon: Icon(Icons.location_on, color: Colors.white),
//                   onPressed: () {
//                     showModalBottomSheet(
//                       context: context,
//                       builder: (context) {
//                         return ListView(
//                           children: locations.keys.map((location) {
//                             return ListTile(
//                               title: Text(location),
//                               onTap: () {
//                                 List<String> parts = location.split(" ; ");
//                                 _changeLocation(parts[0], parts[1]);
//                                 Navigator.pop(context);
//                               },
//                             );
//                           }).toList(),
//                         );
//                       },
//                     );
//                   },
//                 ),
//                 title: Text(
//                   "الصلاة القادمة: $nextPrayer",
//                   style: TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.bold),
//                 ),
//                 subtitle: Text(
//                   "الوقت المتبقي: ${timeRemaining.inHours} ساعة و ${timeRemaining.inMinutes % 60} دقيقة",
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 trailing: Text(
//                   "$selectedCountry ; $selectedCity",
//                   style: TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             Expanded(
//               child: ListView(
//                 children: [
//                   _buildPrayerCard(
//                       "الفجر", prayerTimes.fajr, Icons.wb_twighlight),
//                   _buildPrayerCard("الظهر", prayerTimes.dhuhr, Icons.wb_sunny),
//                   _buildPrayerCard("العصر", prayerTimes.asr, Icons.wb_cloudy),
//                   _buildPrayerCard(
//                       "المغرب", prayerTimes.maghrib, Icons.nightlight_round),
//                   _buildPrayerCard(
//                       "العشاء", prayerTimes.isha, Icons.brightness_3),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPrayerCard(String name, DateTime time, IconData icon) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       elevation: 3,
//       child: ListTile(
//         leading: Icon(icon, color: Colors.green[700]),
//         title: Text(
//           name,
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         trailing: Text(
//           "${time.hour}:${time.minute.toString().padLeft(2, '0')}",
//           style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.green[700]),
//         ),
//       ),
//     );
//   }
// }
