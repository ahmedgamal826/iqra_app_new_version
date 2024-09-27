import 'dart:convert';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:iqra_app_new_version_22/models/prayer_times_model.dart';
import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_states.dart';
import 'package:iqra_app_new_version_22/screens/Prayer_Times/prayer_times_screen.dart';
import 'package:iqra_app_new_version_22/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrayerTimesCubit extends Cubit<PrayerTimesState> {
  final Connectivity _connectivity = Connectivity();

  PrayerTimesCubit() : super(PrayerTimesInitial());

  // Function to calculate countdown to the next prayer time
  Duration calculateCountdown(DateTime nextPrayerTime) {
    return nextPrayerTime.difference(DateTime.now());
  }

// Function to save prayer times to SharedPreferences
  Future<void> savePrayerTimes(
      String city, String country, PrayerTimes prayerTimes) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('$city-$country-fajr', prayerTimes.fajr);
    prefs.setString('$city-$country-dhuhr', prayerTimes.dhuhr);
    prefs.setString('$city-$country-asr', prayerTimes.asr);
    prefs.setString('$city-$country-maghrib', prayerTimes.maghrib);
    prefs.setString('$city-$country-isha', prayerTimes.isha);
  }

// Function to load prayer times from SharedPreferences
  Future<PrayerTimes?> loadPrayerTimes(String city, String country) async {
    final prefs = await SharedPreferences.getInstance();
    final fajr = prefs.getString('$city-$country-fajr');
    final dhuhr = prefs.getString('$city-$country-dhuhr');
    final asr = prefs.getString('$city-$country-asr');
    final maghrib = prefs.getString('$city-$country-maghrib');
    final isha = prefs.getString('$city-$country-isha');

    if (fajr != null &&
        dhuhr != null &&
        asr != null &&
        maghrib != null &&
        isha != null) {
      return PrayerTimes(
        fajr: fajr,
        dhuhr: dhuhr,
        asr: asr,
        maghrib: maghrib,
        isha: isha,
      );
    }
    return null; // Return null if no data is found
  }

  // Function to fetch prayer times from API or load from SharedPreferences
  Future<void> fetchPrayerTimes(String city, String country, context) async {
    emit(PrayerTimesLoading());

    try {
      final connectivityResult = await _connectivity.checkConnectivity();

      // If no internet connection, try to load saved data from SharedPreferences
      if (connectivityResult == ConnectivityResult.none) {
        final savedPrayerTimes = await loadPrayerTimes(city, country);
        if (savedPrayerTimes != null) {
          emit(PrayerTimesLoaded(savedPrayerTimes));
        } else {
          emit(PrayerTimesError(
              'لا يوجد اتصال بالإنترنت ولا توجد بيانات محفوظة لمواقيت الصلاة.'));
        }
        return; // Stop further execution if no internet connection
      }

      // If internet connection is available, fetch data from API
      DateTime now = DateTime.now();
      String formattedDate = "${now.day}-${now.month}-${now.year}";
      String apiUrl =
          'https://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&date=$formattedDate';
      print("API URL: $apiUrl");

      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print("API Response: $data");

        if (data['data'] != null && data['data']['timings'] != null) {
          PrayerTimes prayerTimes =
              PrayerTimes.fromJson(data['data']['timings']);

          // Save fetched data to local storage (SharedPreferences)
          await savePrayerTimes(city, country, prayerTimes);

          emit(PrayerTimesLoaded(prayerTimes));
        } else {
          emit(PrayerTimesError('الاستجابة لا تحتوي على بيانات الصلاة.'));
        }
      } else {
        print('Error: ${response.statusCode}');
        print('Response body: ${response.body}');
        emit(PrayerTimesError('فشل في تحميل مواقيت الصلاة.'));
      }
    } catch (e) {
      print('Exception occurred: $e');

      // If an error occurs while fetching data, try loading saved data
      final savedPrayerTimes = await loadPrayerTimes(city, country);
      if (savedPrayerTimes != null) {
        emit(PrayerTimesLoaded(savedPrayerTimes));
      } else {
        showNoDataDialog(context);
      }
    }
  }

  void showNoDataDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevent closing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'تنبيه',
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            textAlign: TextAlign.end,
            'يرجي الاتصال بالانترنت لجلب البيانات... الآن بعد الإغلاق سيعرض مواقيت الصلاة لدولة مصر ، محافظة القاهرة',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePageAppApp(
                      suraJsonData: '',
                    ),
                  ),
                  (route) => false, // Remove all previous routes
                );

                fetchPrayerTimes(
                    'Cairo', 'Egypt', context); // جلب مواقيت الصلاة
              },
              child: const Text(
                'إغلاق',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  String getPrayerName(DateTime nextPrayerTime, PrayerTimes prayerTimes) {
    DateFormat dateFormat = DateFormat('HH:mm');
    DateTime fajr = dateFormat.parse(prayerTimes.fajr);
    DateTime dhuhr = dateFormat.parse(prayerTimes.dhuhr);
    DateTime asr = dateFormat.parse(prayerTimes.asr);
    DateTime maghrib = dateFormat.parse(prayerTimes.maghrib);
    DateTime isha = dateFormat.parse(prayerTimes.isha);

    if (nextPrayerTime.hour == fajr.hour &&
        nextPrayerTime.minute == fajr.minute) {
      return 'الفجر';
    } else if (nextPrayerTime.hour == dhuhr.hour &&
        nextPrayerTime.minute == dhuhr.minute) {
      return 'الظهر';
    } else if (nextPrayerTime.hour == asr.hour &&
        nextPrayerTime.minute == asr.minute) {
      return 'العصر';
    } else if (nextPrayerTime.hour == maghrib.hour &&
        nextPrayerTime.minute == maghrib.minute) {
      return 'المغرب';
    } else if (nextPrayerTime.hour == isha.hour &&
        nextPrayerTime.minute == isha.minute) {
      return 'العشاء';
    }
    return '';
  }

  // get Today Date And Day In Arabic Function

  String getTodayDateAndDayInArabic() {
    DateFormat dayFormat = DateFormat('EEEE', 'ar');
    DateFormat dateFormat = DateFormat('d MMMM', 'ar');
    DateTime now = DateTime.now();

    String dayName = dayFormat.format(now);
    String date = dateFormat.format(now);

    return '$dayName. $date';
  }

  // format time in arabic function
  String formatTimeInArabic(String time) {
    // Convert the time to DateTime object
    final DateFormat timeFormat = DateFormat('HH:mm');
    final DateTime parsedTime = timeFormat.parse(time);

    // Format the time in 12-hour format with AM/PM
    final DateFormat arabicTimeFormat = DateFormat('h:mm');
    final String formattedTime = arabicTimeFormat.format(parsedTime);

    // Replace English numerals with Arabic numerals
    return formattedTime.replaceAllMapped(
      RegExp(r'[0-9]'),
      (match) => ArabicNumbers().convert(int.parse(match.group(0)!)),
    );
  }

  // get higri month name function
  String getHijriMonthName(int month) {
    switch (month) {
      case 1:
        return 'محرم';
      case 2:
        return 'صفر';
      case 3:
        return 'ربيع الأول';
      case 4:
        return 'ربيع الآخر';
      case 5:
        return 'جمادى الأول';
      case 6:
        return 'جمادى الآخر';
      case 7:
        return 'رجب';
      case 8:
        return 'شعبان';
      case 9:
        return 'رمضان';
      case 10:
        return 'شوال';
      case 11:
        return 'ذو القعدة';
      case 12:
        return 'ذو الحجة';
      default:
        return '';
    }
  }

  // get next Prayer Time Function

  DateTime getNextPrayerTime(PrayerTimes prayerTimes) {
    DateTime now = DateTime.now();
    DateFormat dateFormat = DateFormat('HH:mm');

    // تحويل أوقات الصلاة إلى كائنات DateTime اليوم
    Map<String, DateTime> times = {
      'الفجر': dateFormat.parse(prayerTimes.fajr),
      'الظهر': dateFormat.parse(prayerTimes.dhuhr),
      'العصر': dateFormat.parse(prayerTimes.asr),
      'المغرب': dateFormat.parse(prayerTimes.maghrib),
      'العشاء': dateFormat.parse(prayerTimes.isha),
    };

    // تحويل أوقات الصلاة إلى كائنات DateTime اليوم الحالي
    times = times.map(
      (key, value) => MapEntry(
        key,
        DateTime(now.year, now.month, now.day, value.hour, value.minute),
      ),
    );

    // إذا كان الوقت الحالي بعد صلاة الفجر، نحتاج إلى تعيين الفجر في اليوم التالي
    if (now.isAfter(times['الفجر']!)) {
      times['الفجر'] = times['الفجر']!.add(Duration(days: 1));
    }

    // العثور على أقرب وقت صلاة بعد الوقت الحالي
    final nextPrayerTimes = times.entries
        .where((entry) => entry.value.isAfter(now))
        .map((entry) => entry.value)
        .toList();

    if (nextPrayerTimes.isNotEmpty) {
      return nextPrayerTimes.reduce((a, b) => a.isBefore(b) ? a : b);
    } else {
      // إذا لم يكن هناك أوقات صلاة متبقية اليوم، حدد صلاة الفجر في اليوم التالي
      return times['الفجر']!;
    }
  }

  // to arabic function
  String toArabic(int number) {
    return ArabicNumbers().convert(number);
  }

  // get follow prayer name
  String getFollowPrayerName(int index) {
    const prayers = ['الفجر', 'الظهر', 'العصر', 'المغرب', 'العشاء'];
    return prayers[index];
  }

  // Function to check if prayer time has passed
  bool isPrayerTimePassed(int index, PrayerTimes prayerTimes) {
    DateTime now = DateTime.now();
    DateFormat dateFormat = DateFormat('HH:mm');

    Map<String, DateTime> prayerTimesMap = {
      'الفجر': dateFormat.parse(prayerTimes.fajr),
      'الظهر': dateFormat.parse(prayerTimes.dhuhr),
      'العصر': dateFormat.parse(prayerTimes.asr),
      'المغرب': dateFormat.parse(prayerTimes.maghrib),
      'العشاء': dateFormat.parse(prayerTimes.isha),
    };

    DateTime prayerTime = DateTime(
      now.year,
      now.month,
      now.day,
      prayerTimesMap.values.elementAt(index).hour,
      prayerTimesMap.values.elementAt(index).minute,
    );

    return now.isAfter(prayerTime);
  }

  //
  String getRemainingTime(DateTime prayerTime) {
    Duration remainingTime = prayerTime.difference(DateTime.now());
    String hours = convertToArabicNumerals(
        remainingTime.inHours.toString().padLeft(2, '0'));
    String minutes = convertToArabicNumerals(
        (remainingTime.inMinutes % 60).toString().padLeft(2, '0'));
    return '$hours ساعة و $minutes دقيقة';
  }

  String convertToArabicNumerals(String input) {
    const arabicNumerals = '٠١٢٣٤٥٦٧٨٩';
    return input.split('').map((char) {
      if (char.contains(RegExp(r'[0-9]'))) {
        return arabicNumerals[int.parse(char)];
      }
      return char;
    }).join('');
  }
}
