import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/widgets/drawer_widgets/provider_brightness.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  double arabicFontSize = 25.0;

  @override
  void initState() {
    super.initState();
    _loadFontSize();
  }

  Future<void> _loadFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      arabicFontSize = (prefs.getDouble('arabicFontSize') ??
          prefs.getInt('arabicFontSize')?.toDouble() ??
          25.0);

      // Ensure the font size is within the new range
      if (arabicFontSize > 30) {
        arabicFontSize = 30;
      } else if (arabicFontSize < 20) {
        arabicFontSize = 20;
      }
    });
  }

  Future<void> _saveFontSize(double fontSize) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('arabicFontSize', fontSize);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<providerBrightness>(
      builder: (context, brightness, child) {
        return Scaffold(
          backgroundColor: brightness.isDark ? Colors.black : Colors.white,
          appBar: AppBar(
            backgroundColor: brightness.isDark ? Colors.black : Colors.green,
            iconTheme: const IconThemeData(
              color: Colors.white,
              size: 30,
            ),
            centerTitle: true,
            title: const Text(
              "الإعدادات",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.settings,
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'حجم خط المصحف',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: brightness.isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    Slider(
                        activeColor: Colors.green,
                        value: arabicFontSize,
                        min: 20,
                        max:
                            30, // Adjust this value to set the maximum font size
                        onChanged: (value) {
                          setState(() {
                            arabicFontSize = value;
                          });
                        }),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: brightness.isDark
                                  ? Colors.white
                                  : Colors.green,
                            ),
                            onPressed: () {
                              setState(() {
                                arabicFontSize = 25; // default
                              });
                              _saveFontSize(25);
                            },
                            child: Text(
                              'إعادة الضبط',
                              style: TextStyle(
                                color: brightness.isDark
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: brightness.isDark
                                  ? Colors.white
                                  : Colors.green,
                            ),
                            onPressed: () {
                              _saveFontSize(arabicFontSize);
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'حفظ',
                              style: TextStyle(
                                  color: brightness.isDark
                                      ? Colors.black
                                      : Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
