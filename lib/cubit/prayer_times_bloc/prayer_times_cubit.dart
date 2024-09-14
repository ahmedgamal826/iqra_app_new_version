// Cubit Logic
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/models/prayer_times_model.dart';
import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_states.dart';

class PrayerTimesCubit extends Cubit<PrayerTimesState> {
  PrayerTimesCubit() : super(PrayerTimesInitial());

  Future<void> fetchPrayerTimes() async {
    emit(PrayerTimesLoading());
    try {
      DateTime now = DateTime.now();
      String formattedDate = "${now.day}-${now.month}-${now.year}";
      String apiUrl =
          'https://api.aladhan.com/v1/timingsByCity/$formattedDate?city=cairo&country=egypt';

      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        PrayerTimes prayerTimes = PrayerTimes.fromJson(data['data']['timings']);
        emit(PrayerTimesLoaded(prayerTimes));
      } else {
        emit(PrayerTimesError('Failed to load prayer times.'));
      }
    } catch (e) {
      emit(PrayerTimesError('Failed to load prayer times.'));
    }
  }
}
