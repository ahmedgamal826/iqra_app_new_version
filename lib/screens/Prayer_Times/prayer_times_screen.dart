import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:iqra_app_new_version_22/models/prayer_times_model.dart';
import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_cubit.dart';
import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_states.dart';
import 'package:iqra_app_new_version_22/widgets/prayer%20times%20widgets/follow_prayers.dart';
import 'dart:ui' as ui;

class PrayerTimesScreen extends StatefulWidget {
  @override
  _PrayerTimesScreenState createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: const Text(
          'مواقيت الصلاة',
          style: TextStyle(
            fontSize: 27,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Image.asset(
            'assets/images/prophet.png',
            width: 50,
          )
        ],
      ),
      body: BlocProvider(
        create: (_) => PrayerTimesCubit()..fetchPrayerTimes(),
        child: BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
          builder: (context, state) {
            if (state is PrayerTimesLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.brown,
                ),
              );
            } else if (state is PrayerTimesLoaded) {
              final prayerTimes = state.prayerTimes;
              final nextPrayerTime = _getNextPrayerTime(prayerTimes);
              final countdown = _calculateCountdown(nextPrayerTime);
              final prayerName = _getPrayerName(nextPrayerTime, prayerTimes);

              double screenHeight = MediaQuery.of(context).size.height;
              return Container(
                height: screenHeight,
                child: ListView(
                  children: [
                    _buildDateContainer(),
                    _buildCountdownCard(nextPrayerTime, countdown, prayerName),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: screenHeight * 0.2,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Directionality(
                          textDirection: ui.TextDirection.rtl,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              _buildPrayerTimeCard('الفجر', prayerTimes.fajr,
                                  'assets/images/fajr.png'),
                              _buildPrayerTimeCard('الظهر', prayerTimes.dhuhr,
                                  'assets/images/dohr.png'),
                              _buildPrayerTimeCard('العصر', prayerTimes.asr,
                                  'assets/images/asr.png'),
                              _buildPrayerTimeCard(
                                  'المغرب',
                                  prayerTimes.maghrib,
                                  'assets/images/maghrib.png'),
                              _buildPrayerTimeCard('العشاء', prayerTimes.isha,
                                  'assets/images/isha.png'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    FollowPrayers(prayerTimes: prayerTimes),
                  ],
                ),
              );
            } else if (state is PrayerTimesError) {
              return Center(
                child: Text(
                  state.error,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              return const Center(
                child: Text('اضغط لتحميل مواقيت الصلاة'),
              );
            }
          },
        ),
      ),
    );
  }

  DateTime _getNextPrayerTime(PrayerTimes prayerTimes) {
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

  Duration _calculateCountdown(DateTime nextPrayerTime) {
    return nextPrayerTime.difference(DateTime.now());
  }

  Widget _buildCountdownCard(
      DateTime nextPrayerTime, Duration countdown, String prayerName) {
    String countdownString =
        '${_toArabic(countdown.inHours)} ساعه ${_toArabic(countdown.inMinutes.remainder(60))} دقيقه ${_toArabic(countdown.inSeconds.remainder(60))} ثانيه';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.brown.shade400,
          borderRadius: BorderRadius.circular(20),
        ),
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'الوقت المتبقي حتي صلاة $prayerName',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              countdownString,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getTodayDateAndDayInArabic() {
    DateFormat dayFormat = DateFormat('EEEE', 'ar');
    DateFormat dateFormat = DateFormat('d MMMM', 'ar');
    DateTime now = DateTime.now();

    String dayName = dayFormat.format(now);
    String date = dateFormat.format(now);

    return '$dayName. $date';
  }

  Widget _buildDateContainer() {
    DateTime now = DateTime.now();
    HijriCalendar hijriCalendar = HijriCalendar.fromDate(now);
    String hijriDate =
        '${_toArabic(hijriCalendar.hDay)} ${_getHijriMonthName(hijriCalendar.hMonth)} ${_toArabic(hijriCalendar.hYear)} هـ';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.brown.shade400,
          borderRadius: BorderRadius.circular(20),
        ),
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              getTodayDateAndDayInArabic(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              hijriDate,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _toArabic(int number) {
    return ArabicNumbers().convert(number);
  }

  String _getHijriMonthName(int month) {
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
        return 'جمادى الأولى';
      case 6:
        return 'جمادى الآخرة';
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

  String _getPrayerName(DateTime nextPrayerTime, PrayerTimes prayerTimes) {
    Map<String, DateTime> prayerTimesMap = {
      'الفجر': DateFormat('HH:mm').parse(prayerTimes.fajr),
      'الظهر': DateFormat('HH:mm').parse(prayerTimes.dhuhr),
      'العصر': DateFormat('HH:mm').parse(prayerTimes.asr),
      'المغرب': DateFormat('HH:mm').parse(prayerTimes.maghrib),
      'العشاء': DateFormat('HH:mm').parse(prayerTimes.isha),
    };

    prayerTimesMap = prayerTimesMap.map(
      (key, value) => MapEntry(
        key,
        DateTime(nextPrayerTime.year, nextPrayerTime.month, nextPrayerTime.day,
            value.hour, value.minute),
      ),
    );

    for (var entry in prayerTimesMap.entries) {
      if (entry.value == nextPrayerTime) {
        return entry.key;
      }
    }

    return 'الفجر';
  }

  // String _toArabic(int number) {
  //   return ArabicNumbers().convert(number);
  // }

  // String _getPrayerName(DateTime nextPrayerTime, PrayerTimes prayerTimes) {
  //   if (nextPrayerTime ==
  //       DateTime(
  //         DateTime.now().year,
  //         DateTime.now().month,
  //         DateTime.now().day,
  //         DateFormat('HH:mm').parse(prayerTimes.fajr).hour,
  //         DateFormat('HH:mm').parse(prayerTimes.fajr).minute,
  //       )) {
  //     return 'الفجر';
  //   } else if (nextPrayerTime ==
  //       DateTime(
  //         DateTime.now().year,
  //         DateTime.now().month,
  //         DateTime.now().day,
  //         DateFormat('HH:mm').parse(prayerTimes.dhuhr).hour,
  //         DateFormat('HH:mm').parse(prayerTimes.dhuhr).minute,
  //       )) {
  //     return 'الظهر';
  //   } else if (nextPrayerTime ==
  //       DateTime(
  //         DateTime.now().year,
  //         DateTime.now().month,
  //         DateTime.now().day,
  //         DateFormat('HH:mm').parse(prayerTimes.asr).hour,
  //         DateFormat('HH:mm').parse(prayerTimes.asr).minute,
  //       )) {
  //     return 'العصر';
  //   } else if (nextPrayerTime ==
  //       DateTime(
  //         DateTime.now().year,
  //         DateTime.now().month,
  //         DateTime.now().day,
  //         DateFormat('HH:mm').parse(prayerTimes.maghrib).hour,
  //         DateFormat('HH:mm').parse(prayerTimes.maghrib).minute,
  //       )) {
  //     return 'المغرب';
  //   } else if (nextPrayerTime ==
  //       DateTime(
  //         DateTime.now().year,
  //         DateTime.now().month,
  //         DateTime.now().day,
  //         DateFormat('HH:mm').parse(prayerTimes.isha).hour,
  //         DateFormat('HH:mm').parse(prayerTimes.isha).minute,
  //       )) {
  //     return 'العشاء';
  //   }
  //   return '';
  // }

  // Widget _buildPrayerTimeCard(
  //     String prayerName, String prayerTime, String imagePath) {
  //   return Container(
  //     margin: const EdgeInsets.all(8.0),
  //     padding: const EdgeInsets.all(8.0),
  //     decoration: BoxDecoration(
  //       color: Colors.brown.shade300,
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     child: Column(
  //       children: [
  //         Image.asset(
  //           imagePath,
  //           height: 50,
  //           width: 50,
  //         ),
  //         const SizedBox(height: 5),
  //         Text(
  //           prayerName,
  //           style: const TextStyle(
  //             fontSize: 16,
  //             fontWeight: FontWeight.bold,
  //             color: Colors.white,
  //           ),
  //         ),
  //         Text(
  //           prayerTime,
  //           style: const TextStyle(
  //             fontSize: 14,
  //             color: Colors.white,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildPrayerTimeCard(
      String prayerName, String prayerTime, String imagePath) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.brown.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imagePath,
            height: MediaQuery.of(context).size.height * 0.05,
            width: 50,
          ),
          const SizedBox(height: 5),
          Text(
            prayerName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            _formatTimeInArabic(prayerTime),
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // String _formatTimeInArabic(String time) {
  //   // Convert the time to Arabic numerals
  //   final DateFormat timeFormat = DateFormat('HH:mm');
  //   final DateTime parsedTime = timeFormat.parse(time);
  //   final String formattedTime = timeFormat.format(parsedTime);
  //   return formattedTime.replaceAllMapped(
  //     RegExp(r'[0-9]'),
  //     (match) => ArabicNumbers().convert(int.parse(match.group(0)!)),
  //   );
  // }

  String _formatTimeInArabic(String time) {
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
}
