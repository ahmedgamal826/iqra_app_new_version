import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/Quran_page/views/widgets/basmallah.dart';
import 'package:iqra_app_new_version_22/Quran_page/views/widgets/drawer_widgets/provider_brightness.dart';
import 'package:iqra_app_new_version_22/Quran_page/views/widgets/header_widget.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDirectionality extends StatelessWidget {
  CustomDirectionality(
      {super.key, required this.index, required this.jsonData});

  final int index;
  final dynamic jsonData;

  Future<double> _getFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    return (prefs.getDouble('arabicFontSize') ??
        prefs.getInt('arabicFontSize')?.toDouble() ??
        25);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final textScaleFactor =
        screenWidth / 400; // Adjust 400 as a base screen width

    return Consumer<providerBrightness>(
      builder: (context, brightness, child) {
        return FutureBuilder<double>(
          future: _getFontSize(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              // has no data
              return const CircularProgressIndicator();
            }
            final arabicFontSize = snapshot.data!;
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  child: SizedBox(
                    width: double.infinity,
                    child: RichText(
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.justify,
                      softWrap: true,
                      locale: const Locale("ar"),
                      text: TextSpan(
                        style: TextStyle(
                          color:
                              brightness.isDark ? Colors.white : Colors.black,
                          fontSize: 26 * textScaleFactor,
                          height: 1.5,
                        ),
                        children: getPageData(index).expand((e) {
                          List<InlineSpan> spans = [];
                          for (var i = e["start"]; i <= e["end"]; i++) {
                            if (i == 1) {
                              spans.add(WidgetSpan(
                                child: HeaderWidget(
                                  e: e,
                                  jsonData: jsonData,
                                ),
                              ));

                              if (index != 1 && index != 187) {
                                spans.add(WidgetSpan(
                                  child: Basmallah(index: 1),
                                ));
                              }
                            }
                            spans.add(
                              TextSpan(
                                text: i == e["start"]
                                    ? "${getVerseQCF(e["surah"], i).replaceAll("", "").substring(0, 1)}\u200A${getVerseQCF(e["surah"], i).replaceAll(" ", " ").substring(1)}"
                                    : getVerseQCF(e["surah"], i)
                                        .replaceAll('', ''),
                                style: TextStyle(
                                  color: brightness.isDark
                                      ? Colors.white
                                      : Colors.black,
                                  height: (index == 1 || index == 2) ? 2 : 1.95,
                                  letterSpacing: 0,
                                  wordSpacing: 0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily:
                                      "QCF_P${index.toString().padLeft(3, "0")}",
                                  fontSize: arabicFontSize * textScaleFactor,
                                ),
                              ),
                            );
                          }
                          return spans;
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
