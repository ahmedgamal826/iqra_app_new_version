// // // // import 'package:flutter/material.dart';
// // // // import 'package:just_audio/just_audio.dart';

// // // // class SurahPlayer extends StatefulWidget {
// // // //   @override
// // // //   _SurahPlayerState createState() => _SurahPlayerState();
// // // // }

// // // // class _SurahPlayerState extends State<SurahPlayer> {
// // // //   final AudioPlayer _player = AudioPlayer();
// // // //   final String surahUrl = 'https://server6.mp3quran.net/akdr/002.mp3';

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _player.setUrl(surahUrl);
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     _player.dispose();
// // // //     super.dispose();
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(title: Text('تشغيل سورة البقرة')),
// // // //       body: Center(
// // // //         child: Column(
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           children: [
// // // //             ElevatedButton(
// // // //               onPressed: () => _player.play(),
// // // //               child: Text('تشغيل'),
// // // //             ),
// // // //             ElevatedButton(
// // // //               onPressed: () => _player.pause(),
// // // //               child: Text('إيقاف مؤقت'),
// // // //             ),
// // // //             ElevatedButton(
// // // //               onPressed: () => _player.stop(),
// // // //               child: Text('إيقاف'),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'package:flutter/material.dart';
// // // import 'package:just_audio/just_audio.dart';
// // // import 'package:rxdart/rxdart.dart';
// // // import 'package:intl/intl.dart';

// // // class SurahPlayer extends StatefulWidget {
// // //   @override
// // //   _SurahPlayerState createState() => _SurahPlayerState();
// // // }

// // // class _SurahPlayerState extends State<SurahPlayer> {
// // //   final AudioPlayer _player = AudioPlayer();
// // //   final String surahUrl = 'https://server6.mp3quran.net/akdr/002.mp3';

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _player.setUrl(surahUrl).then((_) {
// // //       _player.play(); // تشغيل تلقائي عند الفتح
// // //     });
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _player.dispose();
// // //     super.dispose();
// // //   }

// // //   // دالة لتنسيق الوقت بصيغة دقيقة:ثانية
// // //   String formatDuration(Duration? duration) {
// // //     if (duration == null) return "00:00";
// // //     return DateFormat("mm:ss").format(DateTime(0).add(duration));
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(title: Text('تشغيل سورة البقرة')),
// // //       body: Padding(
// // //         padding: EdgeInsets.all(16.0),
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             StreamBuilder<Duration?>(
// // //               stream: _player.durationStream,
// // //               builder: (context, snapshot) {
// // //                 final duration = snapshot.data ?? Duration.zero;
// // //                 return StreamBuilder<Duration>(
// // //                   stream: _player.positionStream,
// // //                   builder: (context, snapshot) {
// // //                     final position = snapshot.data ?? Duration.zero;
// // //                     return Column(
// // //                       children: [
// // //                         Slider(
// // //                           min: 0.0,
// // //                           max: duration.inMilliseconds.toDouble(),
// // //                           value: position.inMilliseconds
// // //                               .toDouble()
// // //                               .clamp(0.0, duration.inMilliseconds.toDouble()),
// // //                           onChanged: (value) {
// // //                             _player.seek(Duration(milliseconds: value.toInt()));
// // //                           },
// // //                         ),
// // //                         Row(
// // //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                           children: [
// // //                             Text(formatDuration(position)), // الوقت الحالي
// // //                             Text(formatDuration(duration)), // الوقت الكلي
// // //                           ],
// // //                         ),
// // //                       ],
// // //                     );
// // //                   },
// // //                 );
// // //               },
// // //             ),
// // //             ElevatedButton(
// // //               onPressed: () => _player.play(),
// // //               child: Text('تشغيل'),
// // //             ),
// // //             ElevatedButton(
// // //               onPressed: () => _player.pause(),
// // //               child: Text('إيقاف مؤقت'),
// // //             ),
// // //             ElevatedButton(
// // //               onPressed: () => _player.stop(),
// // //               child: Text('إيقاف'),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:just_audio/just_audio.dart';
// // import 'package:rxdart/rxdart.dart';
// // import 'package:intl/intl.dart';

// // class SurahPlayer extends StatefulWidget {
// //   @override
// //   _SurahPlayerState createState() => _SurahPlayerState();
// // }

// // class _SurahPlayerState extends State<SurahPlayer> {
// //   final AudioPlayer _player = AudioPlayer();
// //   final String surahUrl = 'https://server6.mp3quran.net/akdr/002.mp3';

// //   @override
// //   void initState() {
// //     super.initState();
// //     _setupAudio();
// //   }

// //   Future<void> _setupAudio() async {
// //     try {
// //       await _player.setUrl(surahUrl);
// //       _player.setLoopMode(LoopMode.off); // تشغيل مرة واحدة بدون تكرار
// //       _player.play(); // تشغيل تلقائي عند التحميل
// //     } catch (e) {
// //       print("خطأ في تحميل السورة: $e");
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     _player.dispose();
// //     super.dispose();
// //   }

// //   String formatDuration(Duration? duration) {
// //     if (duration == null) return "00:00";
// //     return DateFormat("mm:ss").format(DateTime(0).add(duration));
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('تشغيل سورة البقرة')),
// //       body: Padding(
// //         padding: EdgeInsets.all(16.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             StreamBuilder<Duration?>(
// //               stream: _player.durationStream,
// //               builder: (context, snapshot) {
// //                 final duration = snapshot.data ?? Duration.zero;
// //                 return StreamBuilder<Duration>(
// //                   stream: _player.positionStream,
// //                   builder: (context, snapshot) {
// //                     final position = snapshot.data ?? Duration.zero;
// //                     return Column(
// //                       children: [
// //                         Slider(
// //                           min: 0.0,
// //                           max: duration.inMilliseconds.toDouble(),
// //                           value: position.inMilliseconds
// //                               .toDouble()
// //                               .clamp(0.0, duration.inMilliseconds.toDouble()),
// //                           onChanged: (value) {
// //                             _player.seek(Duration(milliseconds: value.toInt()));
// //                           },
// //                         ),
// //                         Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             Text(formatDuration(position)), // الوقت الحالي
// //                             Text(formatDuration(duration)), // الوقت الكلي
// //                           ],
// //                         ),
// //                       ],
// //                     );
// //                   },
// //                 );
// //               },
// //             ),
// //             ElevatedButton(
// //               onPressed: () => _player.play(),
// //               child: Text('تشغيل'),
// //             ),
// //             ElevatedButton(
// //               onPressed: () => _player.pause(),
// //               child: Text('إيقاف مؤقت'),
// //             ),
// //             ElevatedButton(
// //               onPressed: () => _player.stop(),
// //               child: Text('إيقاف'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:rxdart/rxdart.dart';

// class AudioPlayerScreen extends StatefulWidget {
//   @override
//   _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
// }

// class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
//   final AudioPlayer _audioPlayer = AudioPlayer();

//   @override
//   void initState() {
//     super.initState();
//     _audioPlayer.setUrl("https://server6.mp3quran.net/akdr/003.mp3");
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }

//   Stream<PositionData> get _positionDataStream =>
//       Rx.combineLatest2<Duration, Duration?, PositionData>(
//         _audioPlayer.positionStream,
//         _audioPlayer.durationStream,
//         (position, duration) =>
//             PositionData(position, duration ?? Duration.zero),
//       );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("مشغل سورة البقرة")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             StreamBuilder<PositionData>(
//               stream: _positionDataStream,
//               builder: (context, snapshot) {
//                 final positionData =
//                     snapshot.data ?? PositionData(Duration.zero, Duration.zero);
//                 return ProgressBar(
//                   progress: positionData.position,
//                   total: positionData.duration,
//                   onSeek: (duration) {
//                     _audioPlayer.seek(duration);
//                   },
//                 );
//               },
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 StreamBuilder<PlayerState>(
//                   stream: _audioPlayer.playerStateStream,
//                   builder: (context, snapshot) {
//                     final playerState = snapshot.data;
//                     final playing = playerState?.playing ?? false;

//                     return IconButton(
//                       icon: Icon(playing ? Icons.pause : Icons.play_arrow),
//                       iconSize: 50,
//                       onPressed: () {
//                         playing ? _audioPlayer.pause() : _audioPlayer.play();
//                       },
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PositionData {
//   final Duration position;
//   final Duration duration;
//   PositionData(this.position, this.duration);
// }
