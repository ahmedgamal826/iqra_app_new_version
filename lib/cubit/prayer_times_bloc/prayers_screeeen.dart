// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/cubit_prayers.dart';
// import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_cubit.dart';
// import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_states.dart';
// import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/states_prayer.dart';

// class PrayersScreeeen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('مواقيت الصلاة'),
//         centerTitle: true,
//       ),
//       body: BlocBuilder<PrayerTimestestCubit, PrayerTimestestState>(
//         builder: (context, state) {
//           if (state is PrayerTimestestLoaded) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state is PrayerTimestestError) {
//             return Center(
//                 child:
//                     Text(state.message, style: TextStyle(color: Colors.red)));
//           } else if (state is PrayerTimestestLoaded) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 PrayerTimeTile(title: 'الفجر', time: state.fajr),
//                 PrayerTimeTile(title: 'الشروق', time: state.sunrise),
//                 PrayerTimeTile(title: 'الظهر', time: state.dhuhr),
//                 PrayerTimeTile(title: 'العصر', time: state.asr),
//                 PrayerTimeTile(title: 'المغرب', time: state.maghrib),
//                 PrayerTimeTile(title: 'العشاء', time: state.isha),
//                 SizedBox(height: 20),
//                 Text(
//                   'الصلاة القادمة: ${context.read<PrayerTimestestCubit>().getNextPrayerName()}',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   'الوقت المتبقي: ${formatDuration(context.read<PrayerTimestestCubit>().getTimeUntilNextPrayer())}',
//                   style: TextStyle(fontSize: 16, color: Colors.blueAccent),
//                 ),
//               ],
//             );
//           }
//           return Container();
//         },
//       ),
//     );
//   }
// }

// class PrayerTimeTile extends StatelessWidget {
//   final String title;
//   final DateTime time;

//   const PrayerTimeTile({required this.title, required this.time});

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(title,
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//       trailing: Text('${time.hour}:${time.minute.toString().padLeft(2, '0')}',
//           style: TextStyle(fontSize: 16, color: Colors.green)),
//     );
//   }
// }

// String formatDuration(Duration duration) {
//   int hours = duration.inHours;
//   int minutes = duration.inMinutes.remainder(60);
//   return '$hours ساعة و $minutes دقيقة';
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MobilePage extends StatefulWidget {
  @override
  _MobilePageState createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  late String currentTime;

  @override
  void initState() {
    super.initState();
    // تحديث الوقت عند تحميل الصفحة
    updateTime();
  }

  void updateTime() {
    // الحصول على الوقت الحالي مع المنطقة الزمنية الخاصة بالجهاز
    DateTime now = DateTime.now();
    var format = DateFormat("yyyy-MM-dd HH:mm:ss");

    setState(() {
      // تحديث الوقت المعروض
      currentTime = format.format(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Time & Date from Mobile:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              currentTime,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateTime, // إعادة تحديث الوقت عند الضغط على الزر
              child: Text('Refresh Time'),
            ),
          ],
        ),
      ),
    );
  }
}
