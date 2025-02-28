import 'package:iqra_app_new_version_22/models/prayer_times_model.dart';

abstract class PrayerTimesState {
  // final bool isLoading;

  // PrayerTimesState({this.isLoading = false});
}

// Initial State (when nothing has happened yet)
class PrayerTimesInitial extends PrayerTimesState {}

// Loading State (when prayer times are being fetched)
class PrayerTimesLoading extends PrayerTimesState {}

// Loaded State (when prayer times are successfully fetched)
class PrayerTimesLoaded extends PrayerTimesState {
  final PrayerTimes prayerTimes;
  final String country; // متغير الدولة
  final String province; // متغير المحافظة

  PrayerTimesLoaded(this.prayerTimes, this.country, this.province);
}

// Error State (when there's an error fetching the prayer times)
class PrayerTimesError extends PrayerTimesState {
  final String error;

  PrayerTimesError(this.error);
}

class PrayerTimesWaitingForInternet extends PrayerTimesState {}
