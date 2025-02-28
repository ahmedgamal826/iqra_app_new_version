import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iqra_app_new_version_22/globalhelpers/constants.dart';
import 'package:iqra_app_new_version_22/screens/Quran%20Audios%20Newwwwww/quran_audio_neww.dart';
import 'package:iqra_app_new_version_22/screens/Quran_page/views/reciters_view.dart';
import 'package:iqra_app_new_version_22/widgets/drawer_widgets/custom_card_list_tile.dart';
import 'package:iqra_app_new_version_22/widgets/drawer_widgets/prayer_complete_quran.dart';
import 'package:iqra_app_new_version_22/widgets/drawer_widgets/provider_brightness.dart';
import 'package:iqra_app_new_version_22/widgets/drawer_widgets/settings.dart';
import 'package:iqra_app_new_version_22/widgets/drawer_widgets/show_snack_bar.dart';
import 'package:iqra_app_new_version_22/widgets/drawer_widgets/stop_signs.dart';
import 'package:provider/provider.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          backgroundColor: brightness.isDark ? Colors.black : Colors.white,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: DrawerHeader(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: brightness.isDark ? Colors.black : Colors.white,
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
                            color:
                                brightness.isDark ? Colors.white : blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      CustomListTile(
                          icon: Icons.settings,
                          title: 'الإعدادات',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Settings()));
                          }),
                      CustomListTile(
                        icon: FontAwesomeIcons.headphones,
                        title: 'الإستماع للقرآن',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecitersListScreen(),
                            ),
                          );
                        },
                      ),
                      CustomListTile(
                          icon: FontAwesomeIcons.prayingHands,
                          title: 'دعاء ختم القرآن',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PrayerCompleteQuran()));
                          }),
                      CustomListTile(
                          icon: FontAwesomeIcons.bookOpen,
                          title: 'علامات الوقف',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const StopSigns()));
                          }),
                      CustomListTile(
                          icon: isWakelockEnabled
                              ? Icons.visibility_off
                              : Icons.visibility,
                          title: isWakelockEnabled
                              ? 'تعطيل خاصية عدم إطفاء الشاشة'
                              : 'تفعيل خاصية عدم إطفاء الشاشة',
                          onTap: () {
                            toggleWakelock(context);
                          }),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          color: Colors.white,
                          elevation: 7,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: SwitchListTile(
                            title: const Text('الوضع الليلي',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            secondary: const Icon(
                              Icons.nightlight_round,
                              size: 30,
                              color: Colors.green,
                            ),
                            value: brightness.isDark,
                            onChanged: (value) {
                              toggleDarkMode(context);
                              brightness.changeTheme();
                            },
                            activeColor: Colors.green,
                          ),
                        ),
                      ),
                    ],
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
