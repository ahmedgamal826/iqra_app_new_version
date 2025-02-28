// import 'package:equatable/equatable.dart';

// /// **الحالة الأساسية لجميع الحالات الفرعية**
// abstract class PrayerTimestestState extends Equatable {
//   const PrayerTimestestState();

//   @override
//   List<Object?> get props => [];
// }

// /// **حالة تحميل البيانات أثناء جلب المواقيت**
// class PrayerTimestestLoading extends PrayerTimestestState {}

// /// **حالة نجاح جلب المواقيت**
// class PrayerTimestestLoaded extends PrayerTimestestState {
//   final DateTime fajr;
//   final DateTime sunrise;
//   final DateTime dhuhr;
//   final DateTime asr;
//   final DateTime maghrib;
//   final DateTime isha;

//   const PrayerTimestestLoaded({
//     required this.fajr,
//     required this.sunrise,
//     required this.dhuhr,
//     required this.asr,
//     required this.maghrib,
//     required this.isha,
//   });

//   @override
//   List<Object?> get props => [fajr, sunrise, dhuhr, asr, maghrib, isha];
// }

// /// **حالة الخطأ عند فشل جلب البيانات**
// class PrayerTimestestError extends PrayerTimestestState {
//   final String message;

//   const PrayerTimestestError(this.message);

//   @override
//   List<Object?> get props => [message];
// }
