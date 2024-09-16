import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_cubit.dart';
import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_states.dart';
import 'package:iqra_app_new_version_22/widgets/prayer%20times%20widgets/count_down_card.dart';
import 'package:iqra_app_new_version_22/widgets/prayer%20times%20widgets/date_container.dart';
import 'package:iqra_app_new_version_22/widgets/prayer%20times%20widgets/follow_prayers.dart';
import 'dart:ui' as ui;

import 'package:iqra_app_new_version_22/widgets/prayer%20times%20widgets/prayer_time_card.dart';

class PrayerTimesScreen extends StatefulWidget {
  @override
  _PrayerTimesScreenState createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: const Text(
          'مواقيت الصلاة',
          style: TextStyle(
            fontSize: 27,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Image.asset(
            'assets/images/prophet.png',
            width: 50,
          )
        ],
      ),
      body: BlocProvider(
        create: (_) => PrayerTimesCubit()..fetchPrayerTimes(),
        child: BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
          builder: (context, state) {
            final nextPrayer = context.read<PrayerTimesCubit>();
            if (state is PrayerTimesLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.brown,
                ),
              );
            } else if (state is PrayerTimesLoaded) {
              final prayerTimes = state.prayerTimes;
              final nextPrayerTime = nextPrayer.getNextPrayerTime(prayerTimes);
              final countdown = context
                  .read<PrayerTimesCubit>()
                  .calculateCountdown(nextPrayerTime);

              final prayerName = context
                  .read<PrayerTimesCubit>()
                  .getPrayerName(nextPrayerTime, prayerTimes);

              double screenHeight = MediaQuery.of(context).size.height;

              return Container(
                height: screenHeight,
                child: OrientationBuilder(builder: (context, orientation) {
                  return ListView(
                    children: [
                      const SizedBox(height: 10),
                      buildDateContainer(context),
                      buildCountdownCard(
                          nextPrayerTime, countdown, prayerName, context),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: orientation == Orientation.portrait
                            ? screenHeight * 0.2
                            : screenHeight * 0.4,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Directionality(
                            textDirection: ui.TextDirection.rtl,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                buildPrayerTimeCard('الفجر', prayerTimes.fajr,
                                    'assets/images/fajr.png'),
                                buildPrayerTimeCard('الظهر', prayerTimes.dhuhr,
                                    'assets/images/dohr.png'),
                                buildPrayerTimeCard('العصر', prayerTimes.asr,
                                    'assets/images/asr.png'),
                                buildPrayerTimeCard(
                                    'المغرب',
                                    prayerTimes.maghrib,
                                    'assets/images/maghrib.png'),
                                buildPrayerTimeCard('العشاء', prayerTimes.isha,
                                    'assets/images/isha.png'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      FollowPrayers(prayerTimes: prayerTimes),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  );
                }),
              );
            } else if (state is PrayerTimesError) {
              return Center(
                child: Text(
                  state.error,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              return const Center(
                child: Text('اضغط لتحميل مواقيت الصلاة'),
              );
            }
          },
        ),
      ),
    );
  }
}
