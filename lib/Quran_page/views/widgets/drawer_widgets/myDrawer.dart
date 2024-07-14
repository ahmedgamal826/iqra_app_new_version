import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/Quran_page/views/widgets/drawer_widgets/prayer_complete_quran.dart';
import 'package:iqra_app_new_version_22/Quran_page/views/widgets/drawer_widgets/provider_brightness.dart';
import 'package:iqra_app_new_version_22/Quran_page/views/widgets/drawer_widgets/settings.dart';
import 'package:iqra_app_new_version_22/Quran_page/views/widgets/drawer_widgets/stop_signs.dart';
import 'package:iqra_app_new_version_22/globalhelpers/constants.dart';

import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<providerBrightness>(
      builder: (context, brightness, child) {
        return Drawer(
          backgroundColor:
              brightness.isDark ? Colors.black : const Color(0xffF5EDD8),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: DrawerHeader(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: brightness.isDark
                              ? Colors.black
                              : const Color(0xffF5EDD8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/quran.png',
                              width: 90,
                            ),
                            Text(
                              'القرآن الكريم',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: brightness.isDark
                                    ? Colors.white
                                    : blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      color: brightness.isDark
                          ? Colors.black
                          : const Color(0xffF1EEE5),
                      child: Column(
                        children: [
                          InkWell(
                            splashColor: Colors.grey,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Settings()));
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.settings,
                                size: 30,
                                color: brightness.isDark
                                    ? Colors.white
                                    : blackColor,
                              ),
                              title: Text(
                                'الاعدادات',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: brightness.isDark
                                      ? Colors.white
                                      : blackColor,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.red,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PrayerCompleteQuran()));
                            },
                            child: ListTile(
                              leading: Image.asset(
                                'assets/images/dua-hands.png',
                                width: 37,
                                color: brightness.isDark
                                    ? Colors.white
                                    : blackColor,
                              ),
                              title: Text(
                                'دعاء ختم القرآن',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: brightness.isDark
                                      ? Colors.white
                                      : blackColor,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const StopSigns()));
                            },
                            child: ListTile(
                              leading: Image.asset(
                                'assets/images/stop_signs_image.jpg',
                                width: 40,
                              ),
                              title: Text(
                                'علامات الوقف',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: brightness.isDark
                                      ? Colors.white
                                      : blackColor,
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Consumer<providerBrightness>(
                              builder: (context, themeProvider, child) {
                                return Switch(
                                    focusColor: brightness.isDark
                                        ? Colors.white
                                        : blackColor,
                                    activeColor: brightness.isDark
                                        ? Colors.white
                                        : Colors.black,
                                    inactiveTrackColor: Colors.white,
                                    value: themeProvider.isDark,
                                    onChanged: (value) {
                                      setState(() {
                                        themeProvider.changeTheme();
                                      });
                                    });
                              },
                            ),
                            title: Text(
                              'تفعيل الوضع الليلي',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: brightness.isDark
                                    ? Colors.white
                                    : blackColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
