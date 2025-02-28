// import 'dart:async';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class PrayerTgimeHelper {
//   final AudioPlayer _player = AudioPlayer();
//   final Set<String> _playedAdhans =
//       {}; // لتخزين الأوقات التي تم تشغيل الأذان فيها
//   Timer? _timer;

//   /// **ابدأ فحص وقت الصلاة بشكل دوري**
//   void startPrayerTimeChecker(
//       BuildContext context, String prayerName, String prayerTime) {
//     _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
//       _checkPrayerTime(context, prayerName, prayerTime);
//     });
//   }

//   /// **فحص إذا كان الوقت الحالي يوافق وقت الصلاة**
//   void _checkPrayerTime(
//       BuildContext context, String prayerName, String prayerTime) {
//     String currentTime =
//         DateFormat.Hm().format(DateTime.now()); // الوقت الحالي بصيغة "HH:mm"
//     if (currentTime == prayerTime && !_playedAdhans.contains(currentTime)) {
//       _playedAdhans.add(currentTime);
//       _showAdhanDialog(context, prayerName);
//     }
//   }

//   /// **عرض نافذة الأذان وتشغيل الصوت**
//   void _showAdhanDialog(BuildContext context, String prayerName) {
//     String adhanPath = 'audios/adhan1.mp3';

//     _player.play(AssetSource(adhanPath)); // تشغيل الأذان

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(
//             'حان الآن موعد صلاة $prayerName',
//             textAlign: TextAlign.center,
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Icon(Icons.mosque, size: 50, color: Colors.green),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.pause, size: 30, color: Colors.red),
//                     onPressed: () async {
//                       await _player.pause();
//                     },
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.play_arrow,
//                         size: 30, color: Colors.green),
//                     onPressed: () async {
//                       await _player.resume();
//                     },
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.stop, size: 30, color: Colors.black),
//                     onPressed: () async {
//                       await _player.stop();
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               child: const Text("إغلاق"),
//               onPressed: () async {
//                 await _player.stop();
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   /// **إيقاف التايمر عند عدم الحاجة**
//   void dispose() {
//     _timer?.cancel();
//     _player.dispose();
//   }
// }

// // //////////////////////////////////////////////////////////


// // import 'dart:async';
// // import 'package:audioplayers/audioplayers.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // import 'package:intl/intl.dart';

// // class PrayerTimeHelper {
// //   final AudioPlayer _player = AudioPlayer();
// //   final FlutterLocalNotificationsPlugin _notificationsPlugin;
// //   final Set<String> _playedAdhans =
// //       {}; // تخزين الأوقات التي تم تشغيل الأذان فيها
// //   Timer? _timer;

// //   PrayerTimeHelper(this._notificationsPlugin) {
// //     _initializeAudioPlayer();
// //   }

// //   /// **تهيئة مشغل الصوت**
// //   void _initializeAudioPlayer() {
// //     _player.setReleaseMode(ReleaseMode.stop); // تشغيل الأذان لمرة واحدة فقط
// //   }

// //   /// **بدء مراقبة أوقات الصلاة**
// //   void startPrayerTimeChecker(List<Map<String, String>> prayerTimes) {
// //     _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
// //       _checkPrayerTimes(prayerTimes);
// //     });
// //   }

// //   /// **التحقق من كل أوقات الصلاة**
// //   void _checkPrayerTimes(List<Map<String, String>> prayerTimes) {
// //     String currentTime =
// //         DateFormat.Hm().format(DateTime.now()); // الوقت الحالي بصيغة HH:mm
// //     for (var prayer in prayerTimes) {
// //       if (currentTime == prayer['time'] &&
// //           !_playedAdhans.contains(currentTime)) {
// //         _playedAdhans.add(currentTime);
// //         _showAdhanNotification(prayer['name']!);
// //       }
// //     }
// //   }

// //   /// **تشغيل الإشعار مع الأذان**
// //   void _showAdhanNotification(String prayerName) async {
// //     String adhanPath = 'audios/adhan1.mp3';

// //     // تشغيل الأذان تلقائيًا
// //     try {
// //       await _player.play(AssetSource(adhanPath));
// //     } catch (e) {
// //       print("⚠️ خطأ في تشغيل الأذان: $e");
// //     }

// //     // إرسال إشعار محلي
// //     const AndroidNotificationDetails androidDetails =
// //         AndroidNotificationDetails(
// //       'adhan_channel',
// //       'أذان الصلاة',
// //       importance: Importance.max,
// //       priority: Priority.high,
// //       playSound: true, // تشغيل صوت الإشعار
// //       sound: RawResourceAndroidNotificationSound(
// //           'adhan1'), // تأكد من عدم وجود الامتداد .mp3
// //     );
// //     const NotificationDetails notificationDetails =
// //         NotificationDetails(android: androidDetails);
// //     await _notificationsPlugin.show(
// //       0,
// //       'حان الآن وقت صلاة $prayerName',
// //       'الله أكبر، الله أكبر!',
// //       notificationDetails,
// //     );
// //   }

// //   /// **إيقاف الخدمة عند عدم الحاجة**
// //   void dispose() {
// //     _timer?.cancel();
// //     _player.dispose();
// //   }
// // }



































// // ////////////////////////////////////////////////////////////////

