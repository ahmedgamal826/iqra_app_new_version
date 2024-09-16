import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart'; // أضف هذه الاستيراد
import 'package:iqra_app_new_version_22/models/prayer_times_model.dart';

class FollowPrayers extends StatefulWidget {
  final PrayerTimes prayerTimes;

  const FollowPrayers({required this.prayerTimes, Key? key}) : super(key: key);

  @override
  _FollowPrayersState createState() => _FollowPrayersState();
}

class _FollowPrayersState extends State<FollowPrayers> {
  List<bool> _prayerCompleted = [false, false, false, false, false];
  int _completedCount = 0;

  @override
  void initState() {
    super.initState();
    _loadPrayerStatus();
  }

  Future<void> _loadPrayerStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final todayKey = DateFormat('yyyyMMdd').format(DateTime.now());
    final lastSavedDate = prefs.getString('lastSavedDate') ?? '';

    // Check if the saved date is today
    if (lastSavedDate != todayKey) {
      // Reset the prayer status for a new day
      setState(() {
        _prayerCompleted = [false, false, false, false, false];
        _completedCount = 0;
      });
      // Save the reset status
      await _savePrayerStatus();
    } else {
      // Load the saved status
      final savedStatus = prefs.getString(todayKey);
      if (savedStatus != null) {
        final statusList =
            savedStatus.split(',').map((e) => e == 'true').toList();
        setState(() {
          _prayerCompleted = statusList;
          _completedCount =
              _prayerCompleted.where((completed) => completed).length;
        });
      }
    }
    // Update the last saved date
    await prefs.setString('lastSavedDate', todayKey);
  }

  Future<void> _savePrayerStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final todayKey = DateFormat('yyyyMMdd').format(DateTime.now());
    final statusString = _prayerCompleted.map((e) => e.toString()).join(',');
    await prefs.setString(todayKey, statusString);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          width: double.infinity,
          height: screenHeight * 0.25,
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Divider(
                    thickness: 2,
                    color: Colors.white,
                    indent: 20,
                    endIndent: 20,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'لقد قمت بأداء $_completedCount / 5 صلوات اليوم',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(5, (index) {
                        int prayerIndex =
                            (4 - index) % 5; // Reverse the index for display
                        final getFollowPrayers =
                            BlocProvider.of<PrayerTimesCubit>(context);
                        final prayerTimesCubit =
                            context.read<PrayerTimesCubit>();

                        return Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  _prayerCompleted[prayerIndex]
                                      ? Icons.check_circle
                                      : Icons.check_circle_outline,
                                  color: _prayerCompleted[prayerIndex] &&
                                          prayerTimesCubit.isPrayerTimePassed(
                                            prayerIndex,
                                            widget.prayerTimes,
                                          )
                                      ? Colors.green
                                      : Colors.grey,
                                  size: 45,
                                ),
                                onPressed: () {
                                  if (prayerTimesCubit.isPrayerTimePassed(
                                      prayerIndex, widget.prayerTimes)) {
                                    setState(() {
                                      _prayerCompleted[prayerIndex] =
                                          !_prayerCompleted[prayerIndex];
                                      _completedCount = _prayerCompleted
                                          .where((completed) => completed)
                                          .length;
                                      _savePrayerStatus(); // Save the updated status
                                    });
                                  } else {
                                    _showTimeNotReachedDialog(prayerIndex);
                                  }
                                },
                              ),
                              const SizedBox(height: 10),
                              Text(
                                getFollowPrayers
                                    .getFollowPrayerName(prayerIndex),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTimeNotReachedDialog(int index) {
    final getFollowPrayers = BlocProvider.of<PrayerTimesCubit>(context);
    final remaining_time = BlocProvider.of<PrayerTimesCubit>(context);

    DateFormat dateFormat = DateFormat('HH:mm');
    Map<String, DateTime> prayerTimes = {
      'الفجر': dateFormat.parse(widget.prayerTimes.fajr),
      'الظهر': dateFormat.parse(widget.prayerTimes.dhuhr),
      'العصر': dateFormat.parse(widget.prayerTimes.asr),
      'المغرب': dateFormat.parse(widget.prayerTimes.maghrib),
      'العشاء': dateFormat.parse(widget.prayerTimes.isha),
    };

    DateTime prayerTime = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      prayerTimes.values.elementAt(index).hour,
      prayerTimes.values.elementAt(index).minute,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'تنبيه',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Text(
            textAlign: TextAlign.center,
            'وقت صلاة ${getFollowPrayers.getFollowPrayerName(index)} لم يحن بعد. الوقت المتبقي هو ${remaining_time.getRemainingTime(prayerTime)}',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
              ),
              child: const Text(
                'موافق',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
