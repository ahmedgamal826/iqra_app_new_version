import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_cubit.dart';

Widget buildPrayerTimeCard(
    String prayerName, String prayerTime, String imagePath) {
  return OrientationBuilder(
    builder: (context, orientation) {
      final formattedTime = BlocProvider.of<PrayerTimesCubit>(context);

      // Calculate width based on screen orientation
      double containerWidth;
      if (orientation == Orientation.landscape) {
        containerWidth =
            MediaQuery.of(context).size.width * 0.15; // Adjust as needed
      } else {
        containerWidth =
            MediaQuery.of(context).size.width * 0.5; // Adjust as needed
      }

      return Container(
        width: containerWidth,
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
              formattedTime.formatTimeInArabic(prayerTime),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    },
  );
}
