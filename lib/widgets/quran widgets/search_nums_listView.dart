import 'dart:async';
import 'package:easy_container/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/globalhelpers/constants.dart';
import 'package:iqra_app_new_version_22/widgets/drawer_widgets/provider_brightness.dart';
import 'package:iqra_app_new_version_22/widgets/quran%20widgets/page_juz_map.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart';

class SearchNumbersListView extends StatelessWidget {
  final List<int> pageNumbers;
  final void Function(int) onTap;

  SearchNumbersListView({required this.pageNumbers, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Consumer<providerBrightness>(
      builder: (context, brightness, child) {
        return Column(
          children: [
            Card(
              elevation: 7,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "الصفحات",
                  style: TextStyle(
                      fontSize: 20,
                      color: brightness.isDark ? Colors.white : blackColor),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
            ListView.separated(
              reverse: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: EasyContainer(
                    onTap: () {
                      onTap(index);
                      // Call the showJuzDialog function here
                      int juzNumber = getJuzForPage(pageNumbers[index]);
                      showJuzDialog(context, juzNumber);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            pageNumbers[index].toString(),
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'سورة ${getSurahNameArabic(
                              getPageData(pageNumbers[index])[0]["surah"],
                            )}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(
                  color: Colors.grey.withOpacity(.5),
                ),
              ),
              itemCount: pageNumbers.length,
            ),
          ],
        );
      },
    );
  }

  void showJuzDialog(BuildContext context, int juzNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.brown, borderRadius: BorderRadius.circular(40)),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'الجزء $juzNumber',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    // Hide the dialog after 2 seconds
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }

  int getJuzForPage(int pageNumber) {
    for (var entry in pageJuzMap.entries) {
      if (pageNumber < entry.key) {
        return entry.value - 1;
      }
    }
    return pageJuzMap.entries.last.value;
  }
}
