import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_cubit.dart';

Widget buildPrayerTimeCard(BuildContext context, String prayerName,
    String prayerTime, String imagePath) {
  final formattedTime = BlocProvider.of<PrayerTimesCubit>(context);
  return Directionality(
    textDirection: TextDirection.rtl,
    child: ListTile(
      leading: Image.asset(
        imagePath,
        width: MediaQuery.of(context).size.width * 0.1,
      ),
      title: Row(
        children: [
          Text(
            prayerName,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      trailing: Text(
        formattedTime.formatTimeInArabic(prayerTime),
        style: const TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
