import 'dart:convert';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:iqra_app_new_version_22/models/prayer_times_model.dart';
import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_states.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator/translator.dart';

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
    prefs.setString('$city-$country-sunrise', prayerTimes.sunrise);
    prefs.setString('$city-$country-dhuhr', prayerTimes.dhuhr);
    prefs.setString('$city-$country-asr', prayerTimes.asr);
    prefs.setString('$city-$country-maghrib', prayerTimes.maghrib);
    prefs.setString('$city-$country-isha', prayerTimes.isha);
  }

// Function to load prayer times from SharedPreferences
  Future<PrayerTimes?> loadPrayerTimes(String city, String country) async {
    final prefs = await SharedPreferences.getInstance();
    final fajr = prefs.getString('$city-$country-fajr');
    final sunrise = prefs.getString('$city-$country-sunrise');
    final dhuhr = prefs.getString('$city-$country-dhuhr');
    final asr = prefs.getString('$city-$country-asr');
    final maghrib = prefs.getString('$city-$country-maghrib');
    final isha = prefs.getString('$city-$country-isha');

    if (fajr != null &&
        sunrise != null &&
        dhuhr != null &&
        asr != null &&
        maghrib != null &&
        isha != null) {
      return PrayerTimes(
        fajr: fajr,
        sunrise: sunrise,
        dhuhr: dhuhr,
        asr: asr,
        maghrib: maghrib,
        isha: isha,
      );
    }
    return null; // Return null if no data is found
  }

  Future<void> fetchPrayerTimes() async {
    emit(PrayerTimesLoading());

    try {
      // طلب إذن الوصول إلى الموقع
      var status = await Permission.location.request();

      if (status.isDenied) {
        emit(
            PrayerTimesError("⚠ يجب السماح بالوصول إلى الموقع لعرض المواقيت."));
        return;
      } else if (status.isPermanentlyDenied) {
        emit(PrayerTimesError(
            "⚠ تم رفض صلاحية الموقع بشكل دائم. يرجى تفعيلها من إعدادات الجهاز."));
        return;
      }

      // الحصول على الموقع الجغرافي الحالي
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // استخدام الإحداثيات للحصول على المدينة والمحافظة والدولة
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      String city = placemarks[0].locality ?? "Unknown"; // المدينة
      String province =
          placemarks[0].administrativeArea ?? "Unknown"; // المحافظة
      String country = placemarks[0].country ?? "Unknown"; // الدولة

      // استخدام الترجمة لتحويل اسم المحافظة إلى الإنجليزية
      final translator = GoogleTranslator();
      Translation translated = await translator.translate(province, to: 'en');
      String translatedProvince = translated.text.trim();

      // الحصول على التاريخ الحالي بصيغة مناسبة للـ API
      DateTime now = DateTime.now();
      var format = DateFormat("dd-MM-yyyy");
      String currentDate = format.format(now);

      // بناء رابط API لجلب مواقيت الصلاة
      String apiUrl =
          'https://api.aladhan.com/v1/timingsByCity/$currentDate?city=$translatedProvince&country=$country';

      print("🔹 الدولة: $country");
      print("🔹 المدينة: $translatedProvince");

      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        if (data['data'] != null && data['data']['timings'] != null) {
          PrayerTimes prayerTimes =
              PrayerTimes.fromJson(data['data']['timings']);

          // حفظ البيانات في التخزين المحلي
          await savePrayerTimes(translatedProvince, country, prayerTimes);

          emit(PrayerTimesLoaded(prayerTimes, city, country));
        } else {
          emit(PrayerTimesError('⚠ لا توجد بيانات متاحة لمواقيت الصلاة.'));
        }
      } else {
        emit(PrayerTimesError(
            '⚠ خطأ أثناء جلب البيانات من الـ API. الكود: ${response.statusCode}'));
      }
    } catch (e) {
      print('⚠ حدث استثناء أثناء جلب البيانات: $e');
      emit(PrayerTimesError("يرجي الإتصال بالإنترنت لعرض مواقيت الصلاة"));
    }
  }

  String getPrayerName(DateTime nextPrayerTime, PrayerTimes prayerTimes) {
    DateFormat dateFormat = DateFormat('HH:mm');
    DateTime fajr = dateFormat.parse(prayerTimes.fajr);
    DateTime sunrise = dateFormat.parse(prayerTimes.sunrise);
    DateTime dhuhr = dateFormat.parse(prayerTimes.dhuhr);
    DateTime asr = dateFormat.parse(prayerTimes.asr);
    DateTime maghrib = dateFormat.parse(prayerTimes.maghrib);
    DateTime isha = dateFormat.parse(prayerTimes.isha);

    if (nextPrayerTime.hour == fajr.hour &&
        nextPrayerTime.minute == fajr.minute) {
      return 'الفجر';
    } else if (nextPrayerTime.hour == sunrise.hour &&
        nextPrayerTime.minute == sunrise.minute) {
      return 'الشروق';
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
    final DateFormat arabicTimeFormat = DateFormat('hh:mm');
    String formattedTime = arabicTimeFormat.format(parsedTime);

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
      'الشروق': dateFormat.parse(prayerTimes.sunrise),
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
      // 'الشروق': dateFormat.parse(prayerTimes.sunrise),
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
