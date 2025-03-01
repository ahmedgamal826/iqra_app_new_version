import 'package:animate_do/animate_do.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class AudioPlayerNewScreen extends StatefulWidget {
  final String audioUrl;
  final String surahName;

  const AudioPlayerNewScreen(
      {super.key, required this.audioUrl, required this.surahName});

  @override
  _AudioPlayerNewScreenState createState() => _AudioPlayerNewScreenState();
}

class _AudioPlayerNewScreenState extends State<AudioPlayerNewScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    setupPlayer();
  }

  // Future<void> setupPlayer() async {
  //   try {
  //     await _audioPlayer.setUrl(widget.audioUrl);
  //     setState(() => isLoading = false);
  //     _audioPlayer.play();
  //   } catch (e) {
  //     print("خطأ في تحميل الصوت: $e");
  //     setState(() => isLoading = false);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(
  //           "خطأ في تحميل الصوت: لا يوجد اتصال بالإنترنت",
  //           textAlign: TextAlign.right,
  //           style: TextStyle(fontSize: 16),
  //         ),
  //         backgroundColor: Colors.red,
  //         behavior: SnackBarBehavior.floating, // يجعل الـ SnackBar عائمًا
  //         margin: EdgeInsets.all(20), // يضيف مسافة خارجية من جميع الجهات
  //         duration: Duration(seconds: 3),
  //       ),
  //     );
  //   }
  // }

  Future<void> setupPlayer() async {
    try {
      await _audioPlayer.setAudioSource(
        AudioSource.uri(
          Uri.parse(widget.audioUrl),
          tag: MediaItem(
            id: '1',
            album: "القرآن الكريم",
            title: widget.surahName,
            artUri: Uri.parse("asset://assets/images/audio_quran.png"),
          ),
        ),
      );
      setState(() => isLoading = false);
      _audioPlayer.play();
    } catch (e) {
      print("خطأ في تحميل الصوت: $e");
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "خطأ في تحميل الصوت: لا يوجد اتصال بالإنترنت",
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 16),
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(20),
          duration: Duration(seconds: 3),
        ),
      );
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
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              FadeInDown(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset("assets/images/audio_quran.png",
                      width: double.infinity, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              FadeInUp(
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.green)
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
                          icon: const Icon(Icons.replay_10,
                              size: 40, color: Colors.green),
                          onPressed: isLoading
                              ? null
                              : () => _audioPlayer.seek(_audioPlayer.position -
                                  Duration(seconds: 10)),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: isLoading
                              ? null
                              : () => playing
                                  ? _audioPlayer.pause()
                                  : _audioPlayer.play(),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.green,
                            child: Icon(
                                playing ? Icons.pause : Icons.play_arrow,
                                size: 45,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 20),
                        IconButton(
                          icon: const Icon(Icons.forward_10,
                              size: 40, color: Colors.green),
                          onPressed: isLoading
                              ? null
                              : () => _audioPlayer.seek(_audioPlayer.position +
                                  Duration(seconds: 10)),
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
      ),
    );
  }
}

class PositionData {
  final Duration position;
  final Duration duration;
  PositionData(this.position, this.duration);
}
