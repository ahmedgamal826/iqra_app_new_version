import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/Quran_page/views/widgets/drawer_widgets/provider_brightness.dart';
import 'package:iqra_app_new_version_22/cubit/counter_cubit.dart';
import 'package:iqra_app_new_version_22/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => providerBrightness(),
        ),
        BlocProvider(create: (_) => CounterTasbihCubit()),
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
  @override
  var widgejsonData;

  loadJsonAsset() async {
    final String jsonString =
        await rootBundle.loadString('assets/json/surahs.json');
    var data = jsonDecode(jsonString);
    setState(() {
      widgejsonData = data;
    });
  }

  void initState() {
    super.initState();
    loadJsonAsset();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(suraJsonData: widgejsonData),
    );
  }
}
