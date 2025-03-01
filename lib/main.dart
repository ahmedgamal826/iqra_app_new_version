import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/ahades%20bloc/ahades_cubit.dart';
import 'package:iqra_app_new_version_22/cubit/azkar%20bloc/azkar_cubit.dart';
import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_cubit.dart';
import 'package:iqra_app_new_version_22/cubit/stories%20bloc/stories_cubit.dart';
import 'package:iqra_app_new_version_22/cubit/tasbih%20bloc/counter_tasbih_cubit.dart';
import 'package:iqra_app_new_version_22/firebase_options.dart';
import 'package:iqra_app_new_version_22/screens/splash_screen.dart';
import 'package:iqra_app_new_version_22/widgets/drawer_widgets/provider_brightness.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDateFormatting('ar', '');
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.example.audio',
    androidNotificationChannelName: 'تشغيل الصوت',
    androidNotificationOngoing: true,
  );
  runApp(
    MultiProvider(
      providers: [
        BlocProvider(create: (_) => PrayerTimesCubit()..fetchPrayerTimes()),
        ChangeNotifierProvider(
          create: (_) => providerBrightness(),
        ),
        BlocProvider(create: (_) => CounterTasbihCubit()),
        BlocProvider<AzkarCubit>(
          create: (context) => AzkarCubit()..loadSectionDetails(1),
        ),
        BlocProvider<AhadesCubit>(
          create: (context) => AhadesCubit()..loadSectionAhadesDetails(1),
        ),
        BlocProvider<StoriesCubit>(
          create: (context) => StoriesCubit()..loadSectionStoriesDetails(1),
        ),
      ],
      child: const IqraApp(),
    ),
  );
}

class IqraApp extends StatefulWidget {
  const IqraApp({super.key});

  @override
  State<IqraApp> createState() => _IqraAppState();
}

class _IqraAppState extends State<IqraApp> {
  var widgejsonData;

  loadJsonAsset() async {
    final String jsonString =
        await rootBundle.loadString('assets/json/surahs.json');
    var data = jsonDecode(jsonString);
    setState(() {
      widgejsonData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonAsset();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: widgejsonData == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              )
            : SplashScreen(suraJsonData: widgejsonData),
      ),
    );
  }
}
