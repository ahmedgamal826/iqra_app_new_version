import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/globalhelpers/constants.dart';
import 'package:iqra_app_new_version_22/widgets/drawer_widgets/prayer_complete_quran.dart';
import 'package:iqra_app_new_version_22/widgets/drawer_widgets/provider_brightness.dart';
import 'package:iqra_app_new_version_22/widgets/drawer_widgets/settings.dart';
import 'package:iqra_app_new_version_22/widgets/drawer_widgets/show_snack_bar.dart';
import 'package:iqra_app_new_version_22/widgets/drawer_widgets/stop_signs.dart';
import 'package:provider/provider.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:shared_preferences/shared_preferences.dart'; // استيراد مكتبة shared_preferences

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  bool isSwitched = false;
  bool isWakelockEnabled = false;

  @override
  void initState() {
    super.initState();
    loadWakelockState();
  }

  // load wakeloct state using shared preference
  Future<void> loadWakelockState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? savedWakelockState = prefs.getBool('wakelockEnabled');
    setState(() {
      isWakelockEnabled = savedWakelockState ?? false;
      if (isWakelockEnabled) {
        WakelockPlus.enable();
      }
    });
  }

  // save wakeloct state using shared preference
  Future<void> saveWakelockState(bool enabled) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('wakelockEnabled', enabled);
  }

  void toggleDarkMode(BuildContext context) {
    setState(() {
      isSwitched = !isSwitched;

      if (isSwitched) {
        customShowSnackBar(context: context, content: 'تم تفعيل الوضع الليلي');
      } else {
        customShowSnackBar(context: context, content: 'تم تعطيل الوضع الليلي');
      }
    });
  }

  void toggleWakelock(BuildContext context) {
    setState(() {
      isWakelockEnabled = !isWakelockEnabled;

      if (isWakelockEnabled) {
        WakelockPlus.enable();
        saveWakelockState(true);

        customShowSnackBar(
            context: context,
            content: 'تم تفعيل خاصية عدم إطفاء الشاشة أثناء القراءة');
      } else {
        WakelockPlus.disable();
        saveWakelockState(false);

        customShowSnackBar(
            context: context,
            content: 'تم تعطيل خاصية عدم إطفاء الشاشة أثناء القراءة');
      }
    });
  }

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
                            Image.asset('assets/images/quran.png', width: 90),
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
                      child: ListView(
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
                                  width: 40),
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
                          InkWell(
                            onTap: () {
                              toggleWakelock(context);
                            },
                            child: ListTile(
                              leading: IconButton(
                                onPressed: () {
                                  toggleWakelock(context);
                                },
                                icon: Icon(
                                  isWakelockEnabled
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  size: 30,
                                  color: isWakelockEnabled
                                      ? Colors.green
                                      : Colors.red,
                                ),
                              ),
                              title: Text(
                                isWakelockEnabled
                                    ? 'تفعيل خاصية عدم اطفاء الشاشة'
                                    : 'تعطيل خاصية عدم اطفاء الشاشة',
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
                                        toggleDarkMode(context);
                                        themeProvider.changeTheme();
                                      });
                                    });
                              },
                            ),
                            title: Text(
                              'الوضع الليلي',
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
