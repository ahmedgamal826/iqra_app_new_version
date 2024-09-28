import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_cubit.dart';
import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_states.dart';
import 'package:iqra_app_new_version_22/screens/home_page.dart';
import 'package:iqra_app_new_version_22/widgets/prayer%20times%20widgets/close_dialog_button.dart';
import 'package:iqra_app_new_version_22/widgets/prayer%20times%20widgets/count_down_card.dart';
import 'package:iqra_app_new_version_22/widgets/prayer%20times%20widgets/country_translations_list.dart';
import 'package:iqra_app_new_version_22/widgets/prayer%20times%20widgets/date_container.dart';
import 'package:iqra_app_new_version_22/widgets/prayer%20times%20widgets/follow_prayers.dart';
import 'package:iqra_app_new_version_22/widgets/prayer%20times%20widgets/get_provinces_for_country_list.dart';
import 'dart:ui' as ui;

import 'package:iqra_app_new_version_22/widgets/prayer%20times%20widgets/prayer_time_card.dart';
import 'package:iqra_app_new_version_22/widgets/prayer%20times%20widgets/province_translations_list.dart';

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
    BlocProvider.of<PrayerTimesCubit>(context)
      ..fetchPrayerTimes('Cairo', 'Egypt', context);
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

  String selectedCity = 'القاهرة'; // Replace with dynamic input
  String selectedCountry = 'مصر'; // Replace with dynamic input

  void showLocationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'اختيار الدولة',
            textAlign: TextAlign.end,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                ),
                onPressed: () {
                  Navigator.pop(context); // Close current dialog
                  showCountrySelectionContainer(
                      context); // Open country selection dialog
                },
                child: const Text(
                  'اختر الدولة',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  TextEditingController searchController =
      TextEditingController(); // For search control

// تعديل دالة getCountries
  List<String> getCountries() {
    return countryTranslations.keys.toList();
  }

  // // تعديل دالة showCountrySelectionContainer
  void showCountrySelectionContainer(BuildContext context) {
    List<String> countries = getCountries();

    TextEditingController searchController =
        TextEditingController(); // For search control

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            textAlign: TextAlign.end,
            'اختيار الدولة',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Container(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              children: [
                TextField(
                  textAlign: TextAlign.right,
                  controller: searchController,
                  onChanged: (value) {
                    (context as Element).reassemble();
                  },
                  decoration: const InputDecoration(
                    // labelText: 'ابحث عن الدولة',
                    label: Text(
                      'Search the country...',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 15),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      // Filter countries based on both Arabic and English names
                      List<String> filteredCountries =
                          countries.where((country) {
                        String countryArabic =
                            countryTranslations[country] ?? country;
                        return country.toLowerCase().contains(
                                searchController.text.toLowerCase()) ||
                            countryArabic
                                .toLowerCase()
                                .contains(searchController.text.toLowerCase());
                      }).toList();

                      return ListView.builder(
                        itemCount: filteredCountries.length,
                        itemBuilder: (context, index) {
                          String countryEnglish = filteredCountries[index];
                          String countryArabic =
                              countryTranslations[countryEnglish] ??
                                  countryEnglish;

                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedCity = filteredCountries[index];

                                  context
                                      .read<PrayerTimesCubit>()
                                      .fetchPrayerTimes(selectedCountry,
                                          selectedCity, context);
                                });
                                Navigator.pop(context);
                                showProvinceSelectionContainer(
                                    context, countryEnglish);
                                context
                                    .read<PrayerTimesCubit>()
                                    .fetchPrayerTimes(
                                        selectedCountry, selectedCity, context);
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  leading: const Icon(
                                    Icons.flag, // Replace with a relevant icon
                                    color: Colors.blue,
                                  ),
                                  title: Text(
                                    countryArabic,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  trailing: const Icon(
                                    Icons
                                        .arrow_forward, // Arrow indicating selection
                                    color: Colors.grey,
                                  ),
                                  contentPadding: const EdgeInsets.all(15),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                // const CloseDialogButton(),
              ],
            ),
          ),
        );
      },
    );
  }

// تعديل دالة showProvinceSelectionContainer
  void showProvinceSelectionContainer(BuildContext context, String country) {
    List<String> provinces = getProvincesForCountry(country);
    TextEditingController searchController =
        TextEditingController(); // For search control

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('اختيار المحافظة'),
          content: Container(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              children: [
                TextField(
                  textAlign: TextAlign.right,
                  controller: searchController,
                  onChanged: (value) {
                    (context as Element).reassemble();
                  },
                  decoration: const InputDecoration(
                    label: Text(
                      'Search the city...',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 15),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      List<String> filteredCities = provinces.where((city) {
                        String cityArabic = provinceTranslations[city] ?? city;
                        return country.toLowerCase().contains(
                                searchController.text.toLowerCase()) ||
                            cityArabic
                                .toLowerCase()
                                .contains(searchController.text.toLowerCase());
                      }).toList();

                      return ListView.builder(
                        itemCount: filteredCities.length,
                        itemBuilder: (context, index) {
                          String provinceEnglish = filteredCities[index];
                          String provinceArabic =
                              provinceTranslations[provinceEnglish] ??
                                  provinceEnglish;

                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedCountry = filteredCities[index];

                                context
                                    .read<PrayerTimesCubit>()
                                    .fetchPrayerTimes(
                                        selectedCountry, selectedCity, context);
                              });
                              Navigator.pop(context);

                              context.read<PrayerTimesCubit>().fetchPrayerTimes(
                                  selectedCountry, selectedCity, context);
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: ListTile(
                                  leading: const Icon(
                                    Icons
                                        .location_on, // You can replace this with a relevant icon
                                    color: Colors.blue,
                                  ),
                                  title: Text(
                                    provinceArabic,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  trailing: const Icon(
                                    Icons
                                        .arrow_forward, // Indicates that the item can be tapped
                                    color: Colors.grey,
                                  ),
                                  contentPadding: const EdgeInsets.all(15),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
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
      body: BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
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
                    buildDateContainer(context),
                    Stack(
                      children: [
                        CountdownCard(
                          countdown: countdown,
                          nextPrayerTime: nextPrayerTime,
                          prayerName: prayerName,
                          countryName: selectedCity,
                        ),
                        Positioned(
                          top: 90,
                          right: 50,
                          child: InkWell(
                            onTap: () {
                              showLocationDialog(context);
                            },
                            child: Row(
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width *
                                            0.70,
                                  ),
                                  child: Text(
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    // '$selectedState ، $selectedCountry',
                                    '${provinceTranslations[selectedCountry] ?? selectedCountry} ، ${countryTranslations[selectedCity] ?? selectedCity}',
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    showLocationDialog(context);
                                  },
                                  icon: const Icon(
                                    Icons.location_on,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

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
                              buildPrayerTimeCard('المغرب', prayerTimes.maghrib,
                                  'assets/images/maghrib.png'),
                              buildPrayerTimeCard('العشاء', prayerTimes.isha,
                                  'assets/images/isha.png'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(height: 10),
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
    );
  }
}
