import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/screens/Azkar_page/azkar_screen.dart';
import 'package:iqra_app_new_version_22/screens/More%20Screens/Tasbih_page/askar_tasbih_page.dart';
import 'package:iqra_app_new_version_22/screens/More%20Screens/more_screen.dart';
import 'package:iqra_app_new_version_22/screens/Prayer_Times/prayer_times_screen.dart';
import 'package:iqra_app_new_version_22/screens/Quran_page/views/Quran_page.dart';

class HomePageAppApp extends StatefulWidget {
  HomePageAppApp({super.key, required this.suraJsonData});

  final suraJsonData;

  @override
  State<HomePageAppApp> createState() => _HomePageAppAppState();
}

class _HomePageAppAppState extends State<HomePageAppApp> {
  int currentPageIndex = 4;

  late List<Widget> pages = [
    const AzkarTasbihScreen(), // Tasbeh page
    const AzkarHomePage(), // Azkar page
    const MoreScreen(),
    QuranPage(suraJsonData: widget.suraJsonData), // Quran page

    PrayerTimesScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: currentPageIndex,
        onTap: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.brown,
              icon: Image.asset(
                'assets/images/ramadan.png',
                color: Colors.white,
                width: 40,
              ),
              label: 'السبحة الإلكترونية'),
          BottomNavigationBarItem(
              backgroundColor: Colors.brown,
              icon: Image.asset(
                'assets/images/dua-hands.png',
                color: Colors.white,
                width: 40,
              ),
              label: 'أذكار المسلم'),
          // BottomNavigationBarItem(
          //     backgroundColor: Colors.brown,
          //     icon: Image.asset(
          //       'assets/images/prophet.png',
          //       color: Colors.white,
          //       width: 40,
          //     ),
          //     label: 'الاحاديث الشريفة'),
          BottomNavigationBarItem(
            backgroundColor: Colors.brown,
            icon: Image.asset(
              'assets/images/menu.png',
              color: Colors.white,
              width: 37,
            ),
            label: 'المزيد',
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.brown,
              icon: Image.asset(
                'assets/images/quran (1).png',
                color: Colors.white,
                width: 40,
              ),
              label: 'القرآن الكريم'),
          BottomNavigationBarItem(
              backgroundColor: Colors.brown,
              icon: Image.asset(
                'assets/images/prophet.png',
                width: 40,
                color: Colors.white,
              ),
              label: 'مواقيت الصلاة'),
        ],
      ),
    );
  }
}
