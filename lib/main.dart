import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/ahades%20bloc/ahades_cubit.dart';
import 'package:iqra_app_new_version_22/cubit/azkar%20bloc/azkar_cubit.dart';
import 'package:iqra_app_new_version_22/cubit/stories%20bloc/stories_cubit.dart';
import 'package:iqra_app_new_version_22/cubit/tasbih%20bloc/counter_tasbih_cubit.dart';
import 'package:iqra_app_new_version_22/screens/splash_screen.dart';
import 'package:iqra_app_new_version_22/widgets/drawer_widgets/provider_brightness.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  await initializeDateFormatting('ar', '');

  runApp(
    MultiProvider(
      providers: [
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

  Future<bool> getPermission() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
        return true;
      } else {
        final result = await Permission.location.request();
        return result == PermissionStatus.granted;
      }
    }
    return false;
  }

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
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: getPermission(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              backgroundColor: Color.fromARGB(255, 48, 48, 48),
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          } else if (snapshot.hasData && snapshot.data == true) {
            return SplashScreen(suraJsonData: widgejsonData);
          } else {
            return const Scaffold(
              backgroundColor: Colors.brown,
              body: Center(
                child: Text(
                  'يرجي إعادة تشغيل التطبيق',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
