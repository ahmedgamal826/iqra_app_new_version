// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
// import 'package:rxdart/rxdart.dart';

// class AudioPlayerDialog extends StatefulWidget {
//   final String audioUrl;
//   final String surahName;

//   AudioPlayerDialog({required this.audioUrl, required this.surahName});

//   @override
//   _AudioPlayerDialogState createState() => _AudioPlayerDialogState();
// }

// class _AudioPlayerDialogState extends State<AudioPlayerDialog> {
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     setupPlayer();
//   }

//   Future<void> setupPlayer() async {
//     try {
//       await _audioPlayer.setUrl(widget.audioUrl);
//       setState(() =>
//           isLoading = false); // ✅ عند الانتهاء من التحميل، نخفي الـ Loader
//       _audioPlayer.play();
//     } catch (e) {
//       print("خطأ في تحميل الصوت: $e");
//       setState(() => isLoading = false);
//     }
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
//     return AlertDialog(
//       title: Text(widget.surahName, textAlign: TextAlign.center),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           isLoading
//               ? Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: CircularProgressIndicator(), // ✅ إظهار التحميل
//                 )
//               : StreamBuilder<PositionData>(
//                   stream: _positionDataStream,
//                   builder: (context, snapshot) {
//                     final positionData = snapshot.data ??
//                         PositionData(Duration.zero, Duration.zero);
//                     return ProgressBar(
//                       progress: positionData.position,
//                       total: positionData.duration,
//                       onSeek: (duration) {
//                         _audioPlayer.seek(duration);
//                       },
//                     );
//                   },
//                 ),
//           SizedBox(height: 10),
//           StreamBuilder<PlayerState>(
//             stream: _audioPlayer.playerStateStream,
//             builder: (context, snapshot) {
//               final playerState = snapshot.data;
//               final playing = playerState?.playing ?? false;

//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.replay_10, size: 30),
//                     onPressed: isLoading
//                         ? null
//                         : () => _audioPlayer.seek(
//                             _audioPlayer.position - Duration(seconds: 10)),
//                   ),
//                   IconButton(
//                     icon: Icon(playing ? Icons.pause : Icons.play_arrow,
//                         size: 40),
//                     onPressed: isLoading
//                         ? null
//                         : () {
//                             playing
//                                 ? _audioPlayer.pause()
//                                 : _audioPlayer.play();
//                           },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.forward_10, size: 30),
//                     onPressed: isLoading
//                         ? null
//                         : () => _audioPlayer.seek(
//                             _audioPlayer.position + Duration(seconds: 10)),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ],
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             _audioPlayer.stop();
//             Navigator.pop(context);
//           },
//           child: Text("إغلاق"),
//         ),
//       ],
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

class AudioPlayerScreen extends StatefulWidget {
  final String audioUrl;
  final String surahName;

  const AudioPlayerScreen({required this.audioUrl, required this.surahName});

  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    setupPlayer();
  }

  Future<void> setupPlayer() async {
    try {
      await _audioPlayer.setUrl(widget.audioUrl);
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
        title: Text(
          "سورة ${widget.surahName}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        // elevation: 0,
        // systemOverlayStyle: const SystemUiOverlayStyle(
        //   statusBarColor: Colors.green,
        //   statusBarIconBrightness: Brightness.light,
        // ),
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
                  "assets/images/audio_quran.png",
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

            // ✅ زر الإغلاق
            // FadeInUp(
            //   child: ElevatedButton.icon(
            //     onPressed: () {
            //       _audioPlayer.stop();
            //       Navigator.pop(context);
            //     },
            //     icon: Icon(Icons.close),
            //     label: Text("إغلاق"),
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.redAccent,
            //       foregroundColor: Colors.white,
            //       padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(30),
            //       ),
            //     ),
            //   ),
            // ),
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
