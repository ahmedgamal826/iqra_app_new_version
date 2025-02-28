// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:iqra_app_new_version_22/cubit/quran%20audio%20cubit/surah%20reciters%20cubit/surah_reciters_cubit.dart';
// import 'package:iqra_app_new_version_22/cubit/quran%20audio%20cubit/surah%20reciters%20cubit/surah_reciters_state.dart';
// import 'package:iqra_app_new_version_22/screens/Quran_page/views/audio_player_view.dart';
// import 'package:iqra_app_new_version_22/widgets/quran%20widgets/no_result_widget.dart';

// class SurahRecitersPage extends StatelessWidget {
//   final Map reciter;

//   const SurahRecitersPage({super.key, required this.reciter});

//   @override
//   Widget build(BuildContext context) {
//     final List<String> surahs =
//         (reciter['moshaf'][0]['surah_list'] as String).split(',').map((num) {
//       int index = int.tryParse(num) != null ? int.parse(num) - 1 : -1;
//       return (index >= 0 && index < surahNames.length)
//           ? surahNames[index]
//           : "غير معروف";
//     }).toList();

//     final String serverUrl = reciter['moshaf'][0]['server'];

//     return BlocProvider(
//       create: (_) => SurahRecitersCubit(surahs, serverUrl),
//       child:
//           SurahRecitersView(reciterName: reciter['name'], serverUrl: serverUrl),
//     );
//   }
// }

// class SurahRecitersView extends StatelessWidget {
//   final String reciterName;
//   final String serverUrl;
//   final TextEditingController searchController = TextEditingController();

//   SurahRecitersView(
//       {super.key, required this.reciterName, required this.serverUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.white),
//         backgroundColor: Colors.green,
//         title: Text(
//           "الشيخ $reciterName",
//           style: const TextStyle(
//             fontSize: 22,
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
//             child: TextField(
//               cursorColor: Colors.green,
//               onChanged: (query) =>
//                   context.read<SurahRecitersCubit>().filterSurahs(query),
//               style: const TextStyle(fontSize: 16),
//               textDirection: TextDirection.rtl,
//               decoration: InputDecoration(
//                 contentPadding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//                 hintText: "بحث عن السورة",
//                 hintTextDirection: TextDirection.rtl,
//                 suffixIcon: const Icon(Icons.search, color: Colors.green),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: BorderSide(color: Colors.green[700]!, width: 2),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: BlocBuilder<SurahRecitersCubit, SurahRecitersState>(
//               builder: (context, state) {
//                 if (state is SurahRecitersLoaded) {
//                   return state.surahs.isEmpty
//                       ? const NoResultWidget()
//                       : ListView.builder(
//                           itemCount: state.surahs.length,
//                           itemBuilder: (context, index) {
//                             String surahName = state.surahs[index];
//                             int surahNumber = context
//                                 .read<SurahRecitersCubit>()
//                                 .getSurahNumber(surahName);
//                             String formattedSurahNumber =
//                                 surahNumber.toString().padLeft(3, '0');
//                             String audioUrl =
//                                 "$serverUrl$formattedSurahNumber.mp3";

//                             return Card(
//                               color: Colors.white,
//                               margin: const EdgeInsets.symmetric(
//                                   vertical: 5, horizontal: 10),
//                               elevation: 7,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: ListTile(
//                                 contentPadding:
//                                     const EdgeInsets.symmetric(horizontal: 22),
//                                 leading: const Icon(Icons.play_circle_fill,
//                                     color: Colors.green, size: 30),
//                                 title: Directionality(
//                                   textDirection: TextDirection.rtl,
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       const Icon(Icons.mosque,
//                                           color: Colors.green, size: 25),
//                                       const SizedBox(width: 15),
//                                       Text(
//                                         'سورة $surahName',
//                                         style: const TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 onTap: () {
//                                   FocusScope.of(context).unfocus();
//                                   // showDialog(
//                                   //   context: context,
//                                   //   builder: (context) => AudioPlayerScreen(
//                                   //     audioUrl: audioUrl,
//                                   //     surahName: surahName,
//                                   //   ),
//                                   // );

//                                   Future.delayed(
//                                       const Duration(milliseconds: 300), () {
//                                     showDialog(
//                                       context: context,
//                                       builder: (context) => AudioPlayerScreen(
//                                         audioUrl: audioUrl,
//                                         surahName: surahName,
//                                       ),
//                                     );
//                                   });
//                                 },
//                               ),
//                             );
//                           },
//                         );
//                 }
//                 return const Center(
//                   child: CircularProgressIndicator(
//                     color: Colors.green,
//                   ),
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// final List<String> surahNames = [
//   "الفاتحة",
//   "البقرة",
//   "آل عمران",
//   "النساء",
//   "المائدة",
//   "الأنعام",
//   "الأعراف",
//   "الأنفال",
//   "التوبة",
//   "يونس",
//   "هود",
//   "يوسف",
//   "الرعد",
//   "إبراهيم",
//   "الحجر",
//   "النحل",
//   "الإسراء",
//   "الكهف",
//   "مريم",
//   "طه",
//   "الأنبياء",
//   "الحج",
//   "المؤمنون",
//   "النور",
//   "الفرقان",
//   "الشعراء",
//   "النمل",
//   "القصص",
//   "العنكبوت",
//   "الروم",
//   "لقمان",
//   "السجدة",
//   "الأحزاب",
//   "سبأ",
//   "فاطر",
//   "يس",
//   "الصافات",
//   "ص",
//   "الزمر",
//   "غافر",
//   "فصلت",
//   "الشورى",
//   "الزخرف",
//   "الدخان",
//   "الجاثية",
//   "الأحقاف",
//   "محمد",
//   "الفتح",
//   "الحجرات",
//   "ق",
//   "الذاريات",
//   "الطور",
//   "النجم",
//   "القمر",
//   "الرحمن",
//   "الواقعة",
//   "الحديد",
//   "المجادلة",
//   "الحشر",
//   "الممتحنة",
//   "الصف",
//   "الجمعة",
//   "المنافقون",
//   "التغابن",
//   "الطلاق",
//   "التحريم",
//   "الملك",
//   "القلم",
//   "الحاقة",
//   "المعارج",
//   "نوح",
//   "الجن",
//   "المزمل",
//   "المدثر",
//   "القيامة",
//   "الإنسان",
//   "المرسلات",
//   "النبأ",
//   "النازعات",
//   "عبس",
//   "التكوير",
//   "الإنفطار",
//   "المطففين",
//   "الإنشقاق",
//   "البروج",
//   "الطارق",
//   "الأعلى",
//   "الغاشية",
//   "الفجر",
//   "البلد",
//   "الشمس",
//   "الليل",
//   "الضحى",
//   "الشرح",
//   "التين",
//   "العلق",
//   "القدر",
//   "البينة",
//   "الزلزلة",
//   "العاديات",
//   "القارعة",
//   "التكاثر",
//   "العصر",
//   "الهمزة",
//   "الفيل",
//   "قريش",
//   "الماعون",
//   "الكوثر",
//   "الكافرون",
//   "النصر",
//   "المسد",
//   "الإخلاص",
//   "الفلق",
//   "الناس"
// ];
