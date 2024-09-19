// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_cubit.dart';

// Widget buildPrayerTimeCard(
//     String prayerName, String prayerTime, String imagePath) {
//   return OrientationBuilder(
//     builder: (context, orientation) {
//       final formattedTime = BlocProvider.of<PrayerTimesCubit>(context);

//       // Calculate width based on screen orientation
//       double containerWidth;
//       if (orientation == Orientation.landscape) {
//         containerWidth =
//             MediaQuery.of(context).size.width * 0.15; // Adjust as needed
//       } else {
//         containerWidth =
//             MediaQuery.of(context).size.width * 0.5; // Adjust as needed
//       }

//       return Container(
//         height: MediaQuery.of(context).size.height * 0.3,
//         width: containerWidth,
//         margin: const EdgeInsets.all(8.0),
//         padding: const EdgeInsets.all(5),
//         decoration: BoxDecoration(
//           color: Colors.brown.shade300,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           mainAxisSize:
//               MainAxisSize.min, // Use min to adjust height based on content

//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Image.asset(
//               imagePath,
//               height: MediaQuery.of(context).size.height * 0.05,
//               width: 50,
//             ),
//             const SizedBox(height: 5),
//             Text(
//               'prayerName',
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             Text(
//               formattedTime.formatTimeInArabic(prayerTime),
//               style: const TextStyle(
//                 fontSize: 20,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_cubit.dart';

// Widget buildPrayerTimeCard(
//     String prayerName, String prayerTime, String imagePath) {
//   return OrientationBuilder(
//     builder: (context, orientation) {
//       final formattedTime = BlocProvider.of<PrayerTimesCubit>(context);

//       // Calculate width based on screen orientation
//       double containerWidth;
//       if (orientation == Orientation.landscape) {
//         containerWidth =
//             MediaQuery.of(context).size.width * 0.15; // Adjust as needed
//       } else {
//         containerWidth =
//             MediaQuery.of(context).size.width * 0.5; // Adjust as needed
//       }

//       return Container(
//         width: containerWidth,
//         margin: const EdgeInsets.all(8.0),
//         padding: const EdgeInsets.all(5),
//         decoration: BoxDecoration(
//           color: Colors.brown.shade300,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           mainAxisSize:
//               MainAxisSize.min, // Use min to adjust height based on content
//           crossAxisAlignment:
//               CrossAxisAlignment.center, // Center items horizontally
//           children: [
//             Image.asset(
//               imagePath,
//               height: MediaQuery.of(context).size.height * 0.05,
//               width: 50,
//             ),
//             const SizedBox(height: 5),
//             Text(
//               'prayerNamef',
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             Text(
//               formattedTime.formatTimeInArabic(prayerTime),
//               style: const TextStyle(
//                 fontSize: 20,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }

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
        containerWidth = MediaQuery.of(context).size.width * 0.15;
      } else {
        containerWidth = MediaQuery.of(context).size.width * 0.5;
      }

      return Container(
        width: containerWidth,
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.brown.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double fontSize = constraints.maxWidth > 100 ? 20 : 18;

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  imagePath,
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.20,
                ),
                const SizedBox(height: 5),
                Text(
                  prayerName,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  formattedTime.formatTimeInArabic(prayerTime),
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            );
          },
        ),
      );
    },
  );
}
