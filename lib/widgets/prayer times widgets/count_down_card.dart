import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_cubit.dart';

Widget buildCountdownCard(DateTime nextPrayerTime, Duration countdown,
    String prayerName, BuildContext context) {
  final convert_to_arabic = BlocProvider.of<PrayerTimesCubit>(context);

  String countdownString =
      '${convert_to_arabic.toArabic(countdown.inHours)} ساعه ${convert_to_arabic.toArabic(countdown.inMinutes.remainder(60))} دقيقه ${convert_to_arabic.toArabic(countdown.inSeconds.remainder(60))} ثانيه';

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
