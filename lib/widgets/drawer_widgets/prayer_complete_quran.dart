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
          backgroundColor:
              brightness.isDark ? Colors.white : const Color(0xffF5EDD8),
          appBar: AppBar(
              backgroundColor:
                  brightness.isDark ? Colors.black : const Color(0xffF5EDD8),
              iconTheme: IconThemeData(
                size: 30,
                color: brightness.isDark ? Colors.white : blackColor,
              ),
              centerTitle: true,
              title: Text(
                'دعاء ختم القرآن',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: brightness.isDark ? Colors.white : blackColor,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(
                    'assets/images/dua-hands.png',
                    width: 40,
                    color: brightness.isDark ? Colors.white : Colors.black,
                  ),
                ),
              ]),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: PageView(
              reverse: true,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: brightness.isDark
                            ? const AssetImage('assets/images/prayer1.jpg')
                            : const AssetImage('assets/images/prayer11.jpg'),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: brightness.isDark
                            ? const AssetImage('assets/images/prayer2.jpg')
                            : const AssetImage('assets/images/prayer22.jpg'),
                        fit: BoxFit.fill),
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
