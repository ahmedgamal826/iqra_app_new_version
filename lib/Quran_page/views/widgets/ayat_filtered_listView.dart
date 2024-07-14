import 'package:easy_container/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/Quran_page/views/quran_page_view.dart';
import 'package:quran/quran.dart';

class AyatFilteredListview extends StatelessWidget {
  AyatFilteredListview(
      {super.key,
      required this.ayatFiltered,
      required this.jsonData,
      required this.saveVerse});

  var ayatFiltered;
  var jsonData;
  void Function(int) saveVerse;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount:
          ayatFiltered["occurences"] > 10 ? 10 : ayatFiltered["occurences"],
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: EasyContainer(
            color: Colors.white70,
            borderRadius: 14,
            onTap: () async {
              int verseNumber = ayatFiltered["verses"][index];
              int surahNumber = ayatFiltered["result"][index]["surah"];
              int pageNumber = getPageNumber(surahNumber, verseNumber);
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
            child: Text(
              "سورة ${getSurahNameArabic(ayatFiltered["result"][index]["surah"])} - ${getVerse(ayatFiltered["result"][index]["surah"], ayatFiltered["result"][index]["verse"], verseEndSymbol: true)}",
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
          ),
        );
      },
    );
  }
}
