import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/screens/Quran%20Audios%20Newwwwww/surah_reciters_page.dart';
import 'package:iqra_app_new_version_22/widgets/quran%20widgets/no_result_widget.dart';

class RecitersListScreen extends StatefulWidget {
  @override
  _RecitersListScreenState createState() => _RecitersListScreenState();
}

class _RecitersListScreenState extends State<RecitersListScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> reciters = [
    {
      "name": "الشيخ عبدالله عواد الجهني",
      "identifier": "abdullaah_3awwaad_al-juhaynee"
    },
    {"name": "الشيخ عبدالله بصفر", "identifier": "abdullaah_basfar"},
    {"name": "الشيخ عبدالباسط عبدالصمد", "identifier": "abdulbaset_mujawwad"},
    {"name": "الشيخ عبدالرحمن السديس", "identifier": "abdurrahmaan_as-sudays"},
    {"name": "الشيخ علي الحذيفي", "identifier": "huthayfi"},
    {"name": "الشيخ عبدالمحسن القاسم", "identifier": "abdul_muhsin_alqasim"},
    {"name": "الشيخ عبدالعزيز الأحمد", "identifier": "abdulazeez_al-ahmad"},
    {"name": "الشيخ عبدالودود حنيف", "identifier": "abdulwadood_haneef"},
    {"name": "الشيخ فارس عباد", "identifier": "fares"},
    {"name": "الشيخ محمود خليل الحصري", "identifier": "rifai"},
    {
      "name": "الشيخ مشاري راشد العفاسي",
      "identifier": "mishaari_raashid_al_3afaasee"
    },
    {
      "name": "الشيخ محمد صديق المنشاوي",
      "identifier": "muhammad_siddeeq_al-minshaawee"
    },
    {"name": "الشيخ محمد محمود الطبلاوي", "identifier": "mohammad_altablawi"},
    {"name": "الشيخ محمود علي البنا", "identifier": "mahmood_ali_albana"},
    {"name": "الشيخ سهل ياسين", "identifier": "sahl_yaaseen"},
    {"name": "الشيخ صلاح البدير", "identifier": "salahbudair"},
    {"name": "الشيخ نبيل الرفاعي", "identifier": "nabil_rifa3i"},
    {"name": "الشيخ ياسر الدوسري", "identifier": "yasser_ad-dussary"},
    {"name": "الشيخ ناصر القطامي", "identifier": "nasser_bin_ali_alqatami"},
    {"name": "الشيخ عبدالباري الثبيتي", "identifier": "thubaity"},
    {"name": "الشيخ أحمد العجمي", "identifier": "ahmed_ibn_3ali_al-3ajamy"},
    {"name": "الشيخ عزيز عليلي", "identifier": "aziz_alili"},
    {
      "name": "الشيخ عبدالرزاق بن عبطان الدليمي",
      "identifier": "abdulrazaq_bin_abtan_al_dulaimi"
    },

    {"name": "الشيخ عبدالله خياط", "identifier": "khayat"},
    {"name": "الشيخ عادل الكلباني", "identifier": "adel_kalbani"},
    {"name": "الشيخ عبدالكريم الحازمي", "identifier": "abdulkareem_al_hazmi"},
    {
      "name": "الشيخ عبدالمنعم عبدالمبدئ",
      "identifier": "abdulmun3im_abdulmubdi2"
    },

    {"name": "الشيخ عبد الرشيد صوفي", "identifier": "abdurrashid_sufi"},
    {
      "name": "الشيخ أبو بكر الشاطري",
      "identifier": "abu_bakr_ash-shatri_tarawee7"
    },
    {"name": "الشيخ أحمد نعينع", "identifier": "ahmad_nauina"},
    {"name": "الشيخ أكرم العلقمي", "identifier": "akram_al_alaqmi"},
    {"name": "الشيخ علي حجاج السويسي", "identifier": "ali_hajjaj_alsouasi"},
    {"name": "الشيخ عاصم عبد الحليم", "identifier": "asim_abdulaleem"},
    {"name": "الشيخ هاني الرفاعي", "identifier": "rifai"},
    {"name": "الشيخ محمد حسان", "identifier": "mu7ammad_7assan"},
    /////
    {"name": "الشيخ ماهر المعيقلي", "identifier": "maher_almu3aiqly/year1440"},
    {"name": "الشيخ خليفة الطنيجي", "identifier": "khalifah_taniji"},
    {"name": "الشيخ محمد جبريل", "identifier": "muhammad_jibreel/complete"},
    {"name": "الشيخ محمد أيوب", "identifier": "muhammad_ayyoob_hq"}
  ];

  List<Map<String, dynamic>> filteredReciters = [];

  @override
  void initState() {
    super.initState();
    reciters.sort((a, b) => a['name'].compareTo(b['name']));
    filteredReciters = List.from(reciters);
    _searchController.addListener(() {
      filterReciters(_searchController.text);
    });
  }

  void filterReciters(String query) {
    setState(() {
      if (query.trim().isEmpty) {
        filteredReciters = List.from(reciters);
      } else {
        filteredReciters = reciters
            .where((reciter) => reciter['name'].contains(query.trim()))
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
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
          "اختر القارئ",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              cursorColor: Colors.green,
              controller: _searchController,
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                hintText: "بحث عن القارئ",
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
            const SizedBox(height: 10),
            Expanded(
              child: filteredReciters.isEmpty
                  ? const NoResultWidget()
                  : ListView.builder(
                      itemCount: filteredReciters.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          elevation: 7,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.green[100],
                                child: Icon(Icons.person,
                                    color: Colors.green[700]),
                              ),
                              title: Text(
                                '${filteredReciters[index]['name']}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.green,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SurahRecitersNewPage(
                                        reciter: filteredReciters[index]),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
