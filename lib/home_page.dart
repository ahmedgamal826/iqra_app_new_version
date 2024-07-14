import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/Ahades_page/Screens/home_page_ahades.dart';
import 'package:iqra_app_new_version_22/Azkar_page/Screens/azkar_screen.dart';
import 'package:iqra_app_new_version_22/Names_page/Names.dart';
import 'package:iqra_app_new_version_22/Quran_page/views/Quran_page.dart';
import 'package:iqra_app_new_version_22/Tasbih_page/askar_tasbih_page.dart';

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
    Names(), // Names page
    const HomePageAhades(), // Ahades page
    const AzkarHomePage(), // Azkar page
    QuranPage(suraJsonData: widget.suraJsonData), // Quran page
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
              label: 'المسبحة الإلكترونية'),
          BottomNavigationBarItem(
              backgroundColor: Colors.brown,
              icon: Image.asset(
                'assets/images/allah.png',
                color: Colors.white,
                width: 40,
              ),
              label: 'أسماء الله الحسني'),
          BottomNavigationBarItem(
              backgroundColor: Colors.brown,
              icon: Image.asset(
                'assets/images/prophet.png',
                color: Colors.white,
                width: 40,
              ),
              label: 'الاحاديث الشريفة'),
          BottomNavigationBarItem(
              backgroundColor: Colors.brown,
              icon: Image.asset(
                'assets/images/dua-hands.png',
                color: Colors.white,
                width: 40,
              ),
              label: 'أذكار المسلم'),
          BottomNavigationBarItem(
              backgroundColor: Colors.brown,
              icon: Image.asset(
                'assets/images/quran (1).png',
                width: 40,
                color: Colors.white,
              ),
              label: 'القرآن الكريم'),
        ],
      ),
    );
  }
}
