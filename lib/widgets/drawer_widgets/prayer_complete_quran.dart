import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/globalhelpers/constants.dart';
import 'package:iqra_app_new_version_22/widgets/drawer_widgets/provider_brightness.dart';
import 'package:provider/provider.dart';

class PrayerCompleteQuran extends StatelessWidget {
  const PrayerCompleteQuran({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<providerBrightness>(
      builder: (context, brightness, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              backgroundColor: brightness.isDark ? Colors.black : Colors.green,
              iconTheme: const IconThemeData(
                size: 30,
                color: Colors.white,
              ),
              centerTitle: true,
              title: const Text(
                'دعاء ختم القرآن',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(
                    'assets/images/dua-hands.png',
                    width: 40,
                    color: Colors.white,
                  ),
                ),
              ]),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: PageView(
              reverse: true,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/prayer1.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/prayer2.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
