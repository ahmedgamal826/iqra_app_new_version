// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'surah_reciters_state.dart';

// class SurahRecitersCubit extends Cubit<SurahRecitersState> {
//   final List<String> surahs;
//   String? serverUrl;

//   SurahRecitersCubit(this.surahs, this.serverUrl)
//       : super(SurahRecitersLoaded(surahs));

//   void filterSurahs(String query) {
//     if (query.isEmpty) {
//       emit(SurahRecitersLoaded(surahs));
//     } else {
//       final filtered = surahs
//           .where(
//               (surah) => surah.contains(query) || "سورة $surah".contains(query))
//           .toList();
//       emit(SurahRecitersLoaded(filtered));
//     }
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'surah_reciters_state.dart';

class SurahRecitersCubit extends Cubit<SurahRecitersState> {
  final List<String> surahs;
  final Map<String, int> surahIndexMap = {}; // ✅ خريطة تربط الاسم بالرقم
  String? serverUrl;

  SurahRecitersCubit(this.surahs, this.serverUrl)
      : super(SurahRecitersLoaded(surahs)) {
    _initializeSurahIndexMap();
  }

  void _initializeSurahIndexMap() {
    for (int i = 0; i < surahs.length; i++) {
      surahIndexMap[surahs[i]] = i + 1; // رقم السورة الصحيح
    }
  }

  void filterSurahs(String query) {
    if (query.trim().isEmpty) {
      emit(SurahRecitersLoaded(surahs));
    } else {
      final filtered = surahs
          .where((surah) =>
              surah.contains(query.trim()) ||
              "سورة $surah".contains(query.trim()))
          .toList();
      emit(SurahRecitersLoaded(filtered));
    }
  }

  int getSurahNumber(String surahName) {
    return surahIndexMap[surahName] ?? 1; // ✅ إرجاع الرقم الصحيح
  }
}
