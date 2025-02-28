// import 'dart:async';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:adhan/adhan.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/states_prayer.dart';

// class PrayerTimestestCubit extends Cubit<PrayerTimestestState> {
//   Timer? _timer;

//   PrayerTimestestCubit() : super(PrayerTimestestLoading()) {
//     _startUpdatingPrayerTimes();
//   }

//   /// بدء تحديث مواقيت الصلاة بشكل دوري
//   void _startUpdatingPrayerTimes() async {
//     await updatePrayerTimes();
//     _timer = Timer.periodic(Duration(seconds: 30), (timer) async {
//       await updatePrayerTimes();
//     });
//   }

//   /// إيقاف المؤقت عند إنهاء التطبيق
//   @override
//   Future<void> close() {
//     _timer?.cancel();
//     return super.close();
//   }

//   /// **جلب الموقع الحالي للمستخدم**
//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('خدمة الموقع غير مفعلة');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('تم رفض إذن الموقع');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error('تم رفض إذن الموقع بشكل دائم');
//     }

//     return await Geolocator.getCurrentPosition();
//   }

//   /// **جلب مواقيت الصلاة بناءً على الموقع الحالي**
//   Future<void> updatePrayerTimes() async {
//     try {
//       final position = await _determinePosition();

//       final coordinates = Coordinates(position.latitude, position.longitude);
//       final params = CalculationMethod.muslim_world_league.getParameters();
//       final prayerTimes = PrayerTimes.today(coordinates, params);

//       emit(PrayerTimestestLoaded(
//         fajr: prayerTimes.fajr!,
//         sunrise: prayerTimes.sunrise!,
//         dhuhr: prayerTimes.dhuhr!,
//         asr: prayerTimes.asr!,
//         maghrib: prayerTimes.maghrib!,
//         isha: prayerTimes.isha!,
//       ));
//     } catch (e) {
//       emit(PrayerTimestestError('خطأ في جلب مواقيت الصلاة: $e'));
//     }
//   }

//   /// **تحديد الصلاة القادمة**
//   String getNextPrayerName() {
//     if (state is! PrayerTimestestLoaded) return "جاري التحميل...";

//     final now = DateTime.now();
//     final loadedState = state as PrayerTimestestLoaded;

//     if (now.isBefore(loadedState.fajr)) return "الفجر";
//     if (now.isBefore(loadedState.sunrise)) return "الشروق";
//     if (now.isBefore(loadedState.dhuhr)) return "الظهر";
//     if (now.isBefore(loadedState.asr)) return "العصر";
//     if (now.isBefore(loadedState.maghrib)) return "المغرب";
//     if (now.isBefore(loadedState.isha)) return "العشاء";

//     return "الفجر"; // العودة إلى الفجر بعد منتصف الليل
//   }

//   /// **حساب الوقت المتبقي للصلاة القادمة**
//   Duration getTimeUntilNextPrayer() {
//     if (state is! PrayerTimestestLoaded) return Duration.zero;

//     final now = DateTime.now();
//     final loadedState = state as PrayerTimestestLoaded;
//     final List<DateTime> prayerTimes = [
//       loadedState.fajr,
//       loadedState.sunrise,
//       loadedState.dhuhr,
//       loadedState.asr,
//       loadedState.maghrib,
//       loadedState.isha,
//     ];

//     for (DateTime prayer in prayerTimes) {
//       if (now.isBefore(prayer)) {
//         return prayer.difference(now);
//       }
//     }
//     return loadedState.fajr
//         .difference(now.add(Duration(days: 1))); // الفجر التالي
//   }
// }
