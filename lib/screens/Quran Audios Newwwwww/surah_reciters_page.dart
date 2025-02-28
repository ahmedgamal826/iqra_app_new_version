import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/screens/Quran%20Audios%20Newwwwww/audio_player_new_view.dart';
import 'package:iqra_app_new_version_22/screens/Quran%20Audios%20Newwwwww/surah_names_list.dart';
import 'package:iqra_app_new_version_22/screens/Quran_page/views/surah_reciters_view.dart';
import 'package:iqra_app_new_version_22/widgets/quran%20widgets/no_result_widget.dart';

class SurahRecitersNewPage extends StatelessWidget {
  final Map<String, dynamic> reciter;

  const SurahRecitersNewPage({super.key, required this.reciter});

  @override
  Widget build(BuildContext context) {
    return SurahRecitersView(
      reciterName: reciter['name'],
      reciterIdentifier: reciter['identifier'],
    );
  }
}

class SurahRecitersView extends StatefulWidget {
  final String reciterName;
  final String reciterIdentifier;

  const SurahRecitersView({
    super.key,
    required this.reciterName,
    required this.reciterIdentifier,
  });

  @override
  _SurahRecitersViewState createState() => _SurahRecitersViewState();
}

class _SurahRecitersViewState extends State<SurahRecitersView> {
  final TextEditingController _searchController = TextEditingController();
  List<String> filteredSurahNames = List.from(surahNames);

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      filterSurahs(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void filterSurahs(String query) {
    setState(() {
      if (query.trim().isEmpty) {
        filteredSurahNames = List.from(surahNames);
      } else {
        filteredSurahNames = surahNames
            .where((surah) =>
                surah.contains(query.trim()) ||
                "سورة $surah".contains(query.trim()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
        title: Text(
          "${widget.reciterName}",
          style: const TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              cursorColor: Colors.green,
              controller: _searchController,
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                hintText: "بحث عن السورة",
                hintTextDirection: TextDirection.rtl,
                suffixIcon: const Icon(Icons.search, color: Colors.green),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.green),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.green, width: 2),
                ),
              ),
            ),
          ),
          Expanded(
            child: filteredSurahNames.isEmpty
                ? const NoResultWidget()
                : ListView.builder(
                    itemCount: filteredSurahNames.length,
                    itemBuilder: (context, index) {
                      int surahNumber =
                          surahNames.indexOf(filteredSurahNames[index]) + 1;
                      String formattedSurahNumber =
                          surahNumber.toString().padLeft(3, '0');
                      String audioUrl =
                          "https://download.quranicaudio.com/quran/${widget.reciterIdentifier}/$formattedSurahNumber.mp3";

                      return Card(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        elevation: 7,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 22),
                          leading: const Icon(Icons.play_circle_fill,
                              color: Colors.green, size: 30),
                          title: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.mosque,
                                    color: Colors.green, size: 25),
                                const SizedBox(width: 15),
                                Text(
                                  'سورة ${filteredSurahNames[index]}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            Future.delayed(Duration(milliseconds: 500), () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AudioPlayerNewScreen(
                                    audioUrl: audioUrl,
                                    surahName: filteredSurahNames[index],
                                  ),
                                ),
                              );
                            });
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
