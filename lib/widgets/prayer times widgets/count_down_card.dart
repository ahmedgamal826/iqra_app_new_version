import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_cubit.dart';

class CountdownCard extends StatefulWidget {
  final DateTime nextPrayerTime;
  final Duration countdown;
  final String prayerName;
  final String countryName;

  const CountdownCard(
      {Key? key,
      required this.nextPrayerTime,
      required this.countdown,
      required this.prayerName,
      required this.countryName})
      : super(key: key);

  @override
  _CountdownCardState createState() => _CountdownCardState();
}

class _CountdownCardState extends State<CountdownCard> {
  @override
  Widget build(BuildContext context) {
    final convertToArabic = BlocProvider.of<PrayerTimesCubit>(context);

    String countdownString =
        '- ${convertToArabic.toArabic(widget.countdown.inSeconds.remainder(60))} : '
        '${convertToArabic.toArabic(widget.countdown.inMinutes.remainder(60))} : '
        '${convertToArabic.toArabic(widget.countdown.inHours)} ';

    final higriMonthName = BlocProvider.of<PrayerTimesCubit>(context);
    DateTime now = DateTime.now();
    HijriCalendar hijriCalendar = HijriCalendar.fromDate(now);
    final convert_to_arabic = BlocProvider.of<PrayerTimesCubit>(context);
    String hijriDate =
        '${convert_to_arabic.toArabic(hijriCalendar.hDay)} ${higriMonthName.getHijriMonthName(hijriCalendar.hMonth)} ${convert_to_arabic.toArabic(hijriCalendar.hYear)} هـ';

    // Use BlocProvider to access the PrayerTimesCubit
    final prayerTimesCubit = BlocProvider.of<PrayerTimesCubit>(context);

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            ' الصلاة القادمة: ${widget.prayerName}',
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            '${DateFormat('hh:mm ', 'ar').format(widget.nextPrayerTime)}',
            style: const TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            countdownString,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    hijriDate,
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    softWrap: true,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    prayerTimesCubit.getTodayDateAndDayInArabic(),
                    textAlign: TextAlign.end,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.5,
          // )
        ],
      ),
    );
  }
}
