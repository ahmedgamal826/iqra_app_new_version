// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hijri/hijri_calendar.dart';
// import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_cubit.dart';

// Widget buildDateContainer(BuildContext context) {
//   final higriMonthName = BlocProvider.of<PrayerTimesCubit>(context);
//   DateTime now = DateTime.now();
//   HijriCalendar hijriCalendar = HijriCalendar.fromDate(now);
//   final convert_to_arabic = BlocProvider.of<PrayerTimesCubit>(context);
//   String hijriDate =
//       '${convert_to_arabic.toArabic(hijriCalendar.hDay)} ${higriMonthName.getHijriMonthName(hijriCalendar.hMonth)} ${convert_to_arabic.toArabic(hijriCalendar.hYear)} هـ';

//   // Use BlocProvider to access the PrayerTimesCubit
//   final prayerTimesCubit = BlocProvider.of<PrayerTimesCubit>(context);

//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Container(
//       decoration: BoxDecoration(
//         // color: Colors.green.shade400,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       width: double.infinity,
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             prayerTimesCubit.getTodayDateAndDayInArabic(),
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 35,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           Text(
//             hijriDate,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 25,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
