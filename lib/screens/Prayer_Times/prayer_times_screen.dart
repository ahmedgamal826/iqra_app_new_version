import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_cubit.dart';
import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_states.dart';
import 'package:iqra_app_new_version_22/widgets/prayer%20times%20widgets/count_down_card.dart';
import 'package:iqra_app_new_version_22/widgets/prayer%20times%20widgets/follow_prayers.dart';

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
    BlocProvider.of<PrayerTimesCubit>(context)..fetchPrayerTimes();
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
    // Apply the status bar settings to the entire app
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black, // Ensure the status bar stays black
      statusBarIconBrightness:
          Brightness.light, // White icons in the status bar
    ));

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity, // يجعل الخلفية تمتد لكامل الشاشة

          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/prayer_background33.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
            builder: (context, state) {
              if (state is PrayerTimesLoading) {
                return Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.height * 0.05,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                );
              } else if (state is PrayerTimesLoaded) {
                final prayerTimes = state.prayerTimes;
                final nextPrayer = context.read<PrayerTimesCubit>();
                final nextPrayerTime =
                    nextPrayer.getNextPrayerTime(prayerTimes);
                final countdown = nextPrayer.calculateCountdown(nextPrayerTime);
                final prayerName =
                    nextPrayer.getPrayerName(nextPrayerTime, prayerTimes);

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: InkWell(
                          onTap: () {
                            // showLocationDialog(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                child: Text(
                                  '${state.province} ، ${state.country}',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // showLocationDialog(context);
                                },
                                icon: const Icon(Icons.location_on,
                                    size: 25, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      CountdownCard(
                        countdown: countdown,
                        nextPrayerTime: nextPrayerTime,
                        prayerName: prayerName,
                        countryName: state.country,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Card(
                          color: Colors.white.withOpacity(0.9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                buildPrayerTimeCard(context, 'الفجر',
                                    prayerTimes.fajr, 'assets/images/fajr.png'),
                                buildPrayerTimeCard(
                                    context,
                                    'الشروق',
                                    prayerTimes.sunrise,
                                    'assets/images/sunrise.png'),
                                buildPrayerTimeCard(
                                    context,
                                    'الظهر',
                                    prayerTimes.dhuhr,
                                    'assets/images/dohr.png'),
                                buildPrayerTimeCard(context, 'العصر',
                                    prayerTimes.asr, 'assets/images/asr.png'),
                                buildPrayerTimeCard(
                                    context,
                                    'المغرب',
                                    prayerTimes.maghrib,
                                    'assets/images/maghrib.png'),
                                buildPrayerTimeCard(context, 'العشاء',
                                    prayerTimes.isha, 'assets/images/isha.png'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      FollowPrayers(prayerTimes: prayerTimes),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              } else if (state is PrayerTimesError) {
                return Center(
                  child: Text(state.error,
                      style: const TextStyle(color: Colors.red)),
                );
              } else {
                return const Center(
                  child: Text('اضغط لتحميل مواقيت الصلاة'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
