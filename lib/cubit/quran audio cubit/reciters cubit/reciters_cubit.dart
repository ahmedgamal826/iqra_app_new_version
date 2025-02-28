import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:iqra_app_new_version_22/cubit/quran%20audio%20cubit/reciters%20cubit/reciters_states.dart';
import 'dart:convert';

class RecitersCubit extends Cubit<RecitersState> {
  RecitersCubit() : super(RecitersInitial());

  List<Map<String, dynamic>> allReciters = [];

  Future<void> fetchReciters() async {
    emit(RecitersLoading());
    String apiUrl = "https://www.mp3quran.net/api/v3/reciters?language=ar";

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<Map<String, dynamic>> reciters =
            List<Map<String, dynamic>>.from(data['reciters']);

        List<Map<String, dynamic>> filtered = reciters.where((reciter) {
          if (reciter['moshaf'].isNotEmpty) {
            String surahList = reciter['moshaf'][0]['surah_list'];
            List<String> surahs = surahList.split(',');
            return surahs.length == 114;
          }
          return false;
        }).toList();

        allReciters = filtered;
        emit(RecitersLoaded(filtered));
      } else {
        emit(RecitersError("حدث خطأ أثناء تحميل القراء"));
      }
    } catch (e) {
      emit(RecitersError("خطأ في الاتصال: $e"));
    }
  }

  // void filterReciters(String query) {
  //   final filteredList = allReciters
  //       .where((reciter) =>
  //           reciter['name'].toLowerCase().contains(query.toLowerCase()))
  //       .toList();

  //   emit(RecitersFiltered(filteredList));
  // }

  void filterReciters(String query) {
    query =
        query.toLowerCase().replaceAll("الشيخ ", ""); // إزالة "الشيخ" من البحث

    final filteredList = allReciters.where((reciter) {
      String reciterName =
          reciter['name'].toLowerCase().replaceAll("الشيخ ", "");
      return reciterName.contains(query);
    }).toList();

    emit(RecitersFiltered(filteredList));
  }
}
