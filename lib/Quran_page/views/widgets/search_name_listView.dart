import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/Quran_page/views/quran_page_view.dart';
import 'package:iqra_app_new_version_22/Quran_page/views/widgets/drawer_widgets/provider_brightness.dart';
import 'package:iqra_app_new_version_22/globalhelpers/constants.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart';

class SearchNameListView extends StatelessWidget {
  SearchNameListView(
      {super.key,
      required this.saveVerse,
      required this.filterdData,
      required this.jsonData});

  final void Function(int) saveVerse;
  var filterdData;
  var jsonData;

  @override
  Widget build(BuildContext context) {
    return Consumer<providerBrightness>(
      builder: (context, brightness, child) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(
              color: brightness.isDark
                  ? Colors.white
                  : Colors.grey.withOpacity(.5),
            ),
          ),
          itemCount: filterdData.length,
          itemBuilder: (context, index) {
            int suraNumber = filterdData[index]["number"];
            String suraNameArabic = filterdData[index]["name"];

            String place = filterdData[index]["revelationType"];

            int ayahCount = getVerseCount(suraNumber);

            return Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                child: ListTile(
                  leading: SizedBox(
                    width: 45,
                    height: 45,
                    child: Center(
                      child: Text(
                        suraNumber.toString(),
                        style: TextStyle(
                          color: brightness.isDark ? Colors.white : blackColor,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  title: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'آياتها',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color:
                                  brightness.isDark ? Colors.white : blackColor,
                            ),
                          ),
                          Text(
                            '$ayahCount',
                            style: TextStyle(
                              fontSize: 17,
                              color:
                                  brightness.isDark ? Colors.white : blackColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        place == 'Meccan'
                            ? 'assets/images/kaaba.png'
                            : 'assets/images/prophet.png',
                        width: 40,
                      ),
                    ],
                  ),
                  trailing: Text(
                    suraNameArabic,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: brightness.isDark ? Colors.white : blackColor,
                      fontSize: 23,
                    ),
                  ),
                  onTap: () async {
                    FocusScope.of(context).unfocus();
                    int verseNumber = 1; // Assuming verse number 1

                    int pageNumber = getPageNumber(suraNumber, verseNumber);
                    saveVerse(pageNumber);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuranPageView(
                          pageNumber: pageNumber,
                          jsonData: jsonData,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
