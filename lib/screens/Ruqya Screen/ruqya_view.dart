// // // import 'package:flutter/material.dart';
// // // import 'package:audioplayers/audioplayers.dart';

// // // class RuqyaPage extends StatefulWidget {
// // //   @override
// // //   _RuqyaPageState createState() => _RuqyaPageState();
// // // }

// // // class _RuqyaPageState extends State<RuqyaPage> {
// // //   late AudioPlayer _audioPlayer;
// // //   bool _isPlaying = false;
// // //   bool _isPaused = false;
// // //   Duration _currentPosition = Duration.zero;
// // //   Duration _totalDuration = Duration.zero;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _audioPlayer = AudioPlayer();

// // //     // Listen to player state changes
// // //     _audioPlayer.onPlayerStateChanged.listen((state) {
// // //       if (state == PlayerState.completed) {
// // //         setState(() {
// // //           _isPlaying = false;
// // //           _currentPosition = Duration.zero;
// // //         });
// // //       }
// // //     });

// // //     // Listen to position changes using positionStream
// // //     _audioPlayer.onPositionChanged.listen((duration) {
// // //       setState(() {
// // //         _currentPosition = duration;
// // //       });
// // //     });

// // //     // Listen to duration changes
// // //     _audioPlayer.onDurationChanged.listen((duration) {
// // //       setState(() {
// // //         _totalDuration = duration;
// // //       });
// // //     });
// // //   }

// // //   @override
// // //   void dispose() {
// // //     super.dispose();
// // //     _audioPlayer.dispose();
// // //   }

// // //   void _playPause() async {
// // //     if (_isPlaying) {
// // //       await _audioPlayer.pause();
// // //       setState(() {
// // //         _isPlaying = false;
// // //         _isPaused = true;
// // //       });
// // //     } else if (_isPaused) {
// // //       await _audioPlayer.resume();
// // //       setState(() {
// // //         _isPlaying = true;
// // //         _isPaused = false;
// // //       });
// // //     } else {
// // //       await _audioPlayer.play(AssetSource('assets/audios/ruqya_audio.mp3'));
// // //       setState(() {
// // //         _isPlaying = true;
// // //       });
// // //     }
// // //   }

// // //   void _stop() async {
// // //     await _audioPlayer.stop();
// // //     setState(() {
// // //       _isPlaying = false;
// // //       _currentPosition = Duration.zero;
// // //     });
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         iconTheme: const IconThemeData(color: Colors.white),
// // //         centerTitle: true,
// // //         backgroundColor: Colors.green,
// // //         title: const Text(
// // //           'الرقية الشرعية',
// // //           style: TextStyle(
// // //             fontSize: 25,
// // //             color: Colors.white,
// // //             fontWeight: FontWeight.bold,
// // //           ),
// // //         ),
// // //       ),
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(10.0),
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           crossAxisAlignment: CrossAxisAlignment.center,
// // //           children: [
// // //             // Image of the Ruqya
// // //             Image.asset('assets/images/ruqya_image.png',
// // //                 width: 150, height: 150),
// // //             const SizedBox(height: 20),

// // //             // Audio information
// // //             Text(
// // //               'الرقية الشرعية',
// // //               style: TextStyle(
// // //                 fontSize: 20,
// // //                 fontWeight: FontWeight.bold,
// // //               ),
// // //             ),
// // //             Text(
// // //               '${_currentPosition.toString().split('.').first} / ${_totalDuration.toString().split('.').first}',
// // //               style: TextStyle(fontSize: 16, color: Colors.grey),
// // //             ),
// // //             const SizedBox(height: 30),

// // //             // Control buttons
// // //             Row(
// // //               mainAxisAlignment: MainAxisAlignment.center,
// // //               children: [
// // //                 IconButton(
// // //                   icon: Icon(
// // //                     _isPlaying
// // //                         ? Icons.pause_circle_filled
// // //                         : Icons.play_circle_fill,
// // //                     size: 50,
// // //                     color: Colors.green,
// // //                   ),
// // //                   onPressed: _playPause,
// // //                 ),
// // //                 const SizedBox(width: 20),
// // //                 IconButton(
// // //                   icon: Icon(
// // //                     Icons.stop,
// // //                     size: 50,
// // //                     color: Colors.red,
// // //                   ),
// // //                   onPressed: _stop,
// // //                 ),
// // //               ],
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:just_audio/just_audio.dart';
// // import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
// // import 'package:rxdart/rxdart.dart';
// // import 'package:animate_do/animate_do.dart';

// // class RuqyaPage extends StatefulWidget {
// //   const RuqyaPage({Key? key}) : super(key: key);

// //   @override
// //   _RuqyaPageState createState() => _RuqyaPageState();
// // }

// // class _RuqyaPageState extends State<RuqyaPage> {
// //   final AudioPlayer _audioPlayer = AudioPlayer();
// //   bool isLoading = true;

// //   @override
// //   void initState() {
// //     super.initState();
// //     setupPlayer();
// //   }

// //   // Future<void> setupPlayer() async {
// //   //   try {
// //   //     // تشغيل الصوت من الـ assets
// //   //     await _audioPlayer.setAsset(
// //   //         'audios/ruqya_audio.mp3'); // تأكد من أن الملف في المسار الصحيح
// //   //     setState(() => isLoading = false);
// //   //     _audioPlayer.play();
// //   //   } catch (e) {
// //   //     print("خطأ في تحميل الصوت: $e");
// //   //     setState(() => isLoading = false);
// //   //   }
// //   // }

// //   Future<void> setupPlayer() async {
// //     try {
// //       // تخصيص player واستخدام Extractor يدعم MP3
// //       await _audioPlayer.setAsset(
// //         'audios/ruqya_audio.mp3',
// //         preload: true, // يمكن إضافة preload لزيادة سرعة التحميل
// //       );
// //       setState(() => isLoading = false);
// //       _audioPlayer.play();
// //     } catch (e) {
// //       print("خطأ في تحميل الصوت: $e");
// //       setState(() => isLoading = false);
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     _audioPlayer.dispose();
// //     super.dispose();
// //   }

// //   Stream<PositionData> get _positionDataStream =>
// //       Rx.combineLatest2<Duration, Duration?, PositionData>(
// //         _audioPlayer.positionStream,
// //         _audioPlayer.durationStream,
// //         (position, duration) =>
// //             PositionData(position, duration ?? Duration.zero),
// //       );

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         iconTheme: const IconThemeData(color: Colors.white),
// //         centerTitle: true,
// //         backgroundColor: Colors.green,
// //         title: const Text(
// //           "الرقية الشرعية",
// //           style: TextStyle(
// //             fontWeight: FontWeight.bold,
// //             fontSize: 25,
// //             color: Colors.white,
// //           ),
// //         ),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(20),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             FadeInDown(
// //               child: ClipRRect(
// //                 borderRadius: BorderRadius.circular(15),
// //                 child: Image.asset(
// //                   "assets/images/ruqya_image.png",
// //                   width: double.infinity,
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //             ),
// //             SizedBox(
// //               height: MediaQuery.of(context).size.height * 0.05,
// //             ),
// //             FadeInUp(
// //               child: isLoading
// //                   ? const CircularProgressIndicator(
// //                       color: Colors.green,
// //                     )
// //                   : StreamBuilder<PositionData>(
// //                       stream: _positionDataStream,
// //                       builder: (context, snapshot) {
// //                         final positionData = snapshot.data ??
// //                             PositionData(Duration.zero, Duration.zero);
// //                         return ProgressBar(
// //                           progress: positionData.position,
// //                           total: positionData.duration,
// //                           progressBarColor: Colors.green,
// //                           baseBarColor: Colors.grey[400],
// //                           thumbColor: Colors.green,
// //                           barHeight: 6.0,
// //                           thumbRadius: 8.0,
// //                           onSeek: (duration) => _audioPlayer.seek(duration),
// //                         );
// //                       },
// //                     ),
// //             ),
// //             const SizedBox(height: 20),
// //             FadeInUp(
// //               child: StreamBuilder<PlayerState>(
// //                 stream: _audioPlayer.playerStateStream,
// //                 builder: (context, snapshot) {
// //                   final playerState = snapshot.data;
// //                   final playing = playerState?.playing ?? false;

// //                   return Row(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       IconButton(
// //                         icon: const Icon(
// //                           Icons.replay_10,
// //                           size: 40,
// //                           color: Colors.green,
// //                         ),
// //                         onPressed: isLoading
// //                             ? null
// //                             : () => _audioPlayer.seek(
// //                                 _audioPlayer.position - Duration(seconds: 10)),
// //                       ),
// //                       const SizedBox(width: 20),
// //                       GestureDetector(
// //                         onTap: isLoading
// //                             ? null
// //                             : () {
// //                                 playing
// //                                     ? _audioPlayer.pause()
// //                                     : _audioPlayer.play();
// //                               },
// //                         child: CircleAvatar(
// //                           radius: 35,
// //                           backgroundColor: Colors.green,
// //                           child: Icon(
// //                             playing ? Icons.pause : Icons.play_arrow,
// //                             size: 45,
// //                             color: Colors.white,
// //                           ),
// //                         ),
// //                       ),
// //                       const SizedBox(width: 20),
// //                       IconButton(
// //                         icon: const Icon(
// //                           Icons.forward_10,
// //                           size: 40,
// //                           color: Colors.green,
// //                         ),
// //                         onPressed: isLoading
// //                             ? null
// //                             : () => _audioPlayer.seek(
// //                                 _audioPlayer.position + Duration(seconds: 10)),
// //                       ),
// //                     ],
// //                   );
// //                 },
// //               ),
// //             ),
// //             SizedBox(height: 30),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class PositionData {
// //   final Duration position;
// //   final Duration duration;
// //   PositionData(this.position, this.duration);
// // }

// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:animate_do/animate_do.dart';

// class RuqyaPage extends StatefulWidget {
//   const RuqyaPage({Key? key}) : super(key: key);

//   @override
//   _RuqyaPageState createState() => _RuqyaPageState();
// }

// class _RuqyaPageState extends State<RuqyaPage> {
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     setupPlayer();
//   }

//   // Initialize the audio player and handle potential errors.
//   Future<void> setupPlayer() async {
//     try {
//       // Load the audio file from assets and ensure the path is correct
//       await _audioPlayer.setAsset(
//           'assets/audios/ruqya_audio.mp3'); // Ensure this path is correct

//       setState(() =>
//           isLoading = false); // Hide the loading spinner once audio is ready
//       _audioPlayer.play(); // Start playing the audio
//     } catch (e) {
//       // Handle error if there is a problem loading the audio
//       print("Error loading audio: $e");
//       setState(() => isLoading = false);
//     }
//   }

//   @override
//   void dispose() {
//     _audioPlayer
//         .dispose(); // Dispose of the audio player when the widget is disposed
//     super.dispose();
//   }

//   // Stream to track the current position and duration of the audio
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
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.white),
//         centerTitle: true,
//         backgroundColor: Colors.green,
//         title: const Text(
//           "الرقية الشرعية",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 25,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             FadeInDown(
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: Image.asset(
//                   "assets/images/ruqya_image.png",
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.05,
//             ),
//             FadeInUp(
//               child: isLoading
//                   ? const CircularProgressIndicator(
//                       color: Colors.green,
//                     )
//                   : StreamBuilder<PositionData>(
//                       stream: _positionDataStream,
//                       builder: (context, snapshot) {
//                         final positionData = snapshot.data ??
//                             PositionData(Duration.zero, Duration.zero);
//                         return ProgressBar(
//                           progress: positionData.position,
//                           total: positionData.duration,
//                           progressBarColor: Colors.green,
//                           baseBarColor: Colors.grey[400],
//                           thumbColor: Colors.green,
//                           barHeight: 6.0,
//                           thumbRadius: 8.0,
//                           onSeek: (duration) => _audioPlayer.seek(duration),
//                         );
//                       },
//                     ),
//             ),
//             const SizedBox(height: 20),
//             FadeInUp(
//               child: StreamBuilder<PlayerState>(
//                 stream: _audioPlayer.playerStateStream,
//                 builder: (context, snapshot) {
//                   final playerState = snapshot.data;
//                   final playing = playerState?.playing ?? false;

//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       IconButton(
//                         icon: const Icon(
//                           Icons.replay_10,
//                           size: 40,
//                           color: Colors.green,
//                         ),
//                         onPressed: isLoading
//                             ? null
//                             : () => _audioPlayer.seek(
//                                 _audioPlayer.position - Duration(seconds: 10)),
//                       ),
//                       const SizedBox(width: 20),
//                       GestureDetector(
//                         onTap: isLoading
//                             ? null
//                             : () {
//                                 playing
//                                     ? _audioPlayer.pause()
//                                     : _audioPlayer.play();
//                               },
//                         child: CircleAvatar(
//                           radius: 35,
//                           backgroundColor: Colors.green,
//                           child: Icon(
//                             playing ? Icons.pause : Icons.play_arrow,
//                             size: 45,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 20),
//                       IconButton(
//                         icon: const Icon(
//                           Icons.forward_10,
//                           size: 40,
//                           color: Colors.green,
//                         ),
//                         onPressed: isLoading
//                             ? null
//                             : () => _audioPlayer.seek(
//                                 _audioPlayer.position + Duration(seconds: 10)),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//             SizedBox(height: 30),
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

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:rxdart/rxdart.dart';
import 'package:animate_do/animate_do.dart';

class RaquahScreen extends StatefulWidget {
  @override
  _RaquahScreenState createState() => _RaquahScreenState();
}

class _RaquahScreenState extends State<RaquahScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    setupPlayer();
  }

  Future<void> setupPlayer() async {
    try {
      // استخدام الـ URL المحدد
      await _audioPlayer.setUrl(
          "https://ia903207.us.archive.org/14/items/roqya-shar2ya/assayari-ayn.mp3");
      setState(() => isLoading = false);
      _audioPlayer.play();
    } catch (e) {
      print("خطأ في تحميل الصوت: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest2<Duration, Duration?, PositionData>(
        _audioPlayer.positionStream,
        _audioPlayer.durationStream,
        (position, duration) =>
            PositionData(position, duration ?? Duration.zero),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          "الرقية الشرعية",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInDown(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/images/ruqya_image.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            FadeInUp(
              child: isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.green,
                    )
                  : StreamBuilder<PositionData>(
                      stream: _positionDataStream,
                      builder: (context, snapshot) {
                        final positionData = snapshot.data ??
                            PositionData(Duration.zero, Duration.zero);
                        return ProgressBar(
                          progress: positionData.position,
                          total: positionData.duration,
                          progressBarColor: Colors.green,
                          baseBarColor: Colors.grey[400],
                          thumbColor: Colors.green,
                          barHeight: 6.0,
                          thumbRadius: 8.0,
                          onSeek: (duration) => _audioPlayer.seek(duration),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 20),
            FadeInUp(
              child: StreamBuilder<PlayerState>(
                stream: _audioPlayer.playerStateStream,
                builder: (context, snapshot) {
                  final playerState = snapshot.data;
                  final playing = playerState?.playing ?? false;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.replay_10,
                          size: 40,
                          color: Colors.green,
                        ),
                        onPressed: isLoading
                            ? null
                            : () => _audioPlayer.seek(
                                _audioPlayer.position - Duration(seconds: 10)),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: isLoading
                            ? null
                            : () {
                                playing
                                    ? _audioPlayer.pause()
                                    : _audioPlayer.play();
                              },
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.green,
                          child: Icon(
                            playing ? Icons.pause : Icons.play_arrow,
                            size: 45,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        icon: const Icon(
                          Icons.forward_10,
                          size: 40,
                          color: Colors.green,
                        ),
                        onPressed: isLoading
                            ? null
                            : () => _audioPlayer.seek(
                                _audioPlayer.position + Duration(seconds: 10)),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class PositionData {
  final Duration position;
  final Duration duration;
  PositionData(this.position, this.duration);
}
