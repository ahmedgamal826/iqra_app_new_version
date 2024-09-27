// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_cubit.dart';

// // // Widget buildCountdownCard(DateTime nextPrayerTime, Duration countdown,
// // //     String prayerName, BuildContext context) {
// // //   final convert_to_arabic = BlocProvider.of<PrayerTimesCubit>(context);

// // //   String countdownString =
// // //       '${convert_to_arabic.toArabic(countdown.inHours)} ساعه ${convert_to_arabic.toArabic(countdown.inMinutes.remainder(60))} دقيقه ${convert_to_arabic.toArabic(countdown.inSeconds.remainder(60))} ثانيه';

// // //   return Padding(
// // //     padding: const EdgeInsets.symmetric(horizontal: 10),
// // //     child: Container(
// // //       decoration: BoxDecoration(
// // //         color: Colors.brown.shade400,
// // //         borderRadius: BorderRadius.circular(20),
// // //       ),
// // //       width: double.infinity,
// // //       padding: const EdgeInsets.all(16.0),
// // //       child: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.center,
// // //         children: [
// // //           Text(
// // //             'الوقت المتبقي حتي صلاة $prayerName',
// // //             textAlign: TextAlign.center,
// // //             style: const TextStyle(
// // //               fontSize: 20,
// // //               fontWeight: FontWeight.bold,
// // //               color: Colors.white,
// // //             ),
// // //           ),
// // //           const SizedBox(height: 8),
// // //           Text(
// // //             countdownString,
// // //             textAlign: TextAlign.center,
// // //             style: const TextStyle(
// // //               fontSize: 20,
// // //               fontWeight: FontWeight.bold,
// // //               color: Colors.white,
// // //             ),
// // //           ),
// // //           const SizedBox(height: 8),
// // //           Row(
// // //             mainAxisAlignment: MainAxisAlignment.end,
// // //             children: [
// // //               const Text(
// // //                 'مصر ، القاهرة',
// // //                 textAlign: TextAlign.center,
// // //                 style: const TextStyle(
// // //                   fontSize: 18,
// // //                   fontWeight: FontWeight.bold,
// // //                   color: Colors.white,
// // //                 ),
// // //               ),
// // //               IconButton(
// // //                 onPressed: () {},
// // //                 icon: const Icon(
// // //                   color: Colors.white,
// // //                   Icons.location_on_sharp,
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ],
// // //       ),
// // //     ),
// // //   );
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_cubit.dart';

// // Widget buildCountdownCard(DateTime nextPrayerTime, Duration countdown,
// //     String prayerName, BuildContext context) {
// //   final convert_to_arabic = BlocProvider.of<PrayerTimesCubit>(context);

// //   String countdownString =
// //       '${convert_to_arabic.toArabic(countdown.inHours)} ساعه ${convert_to_arabic.toArabic(countdown.inMinutes.remainder(60))} دقيقه ${convert_to_arabic.toArabic(countdown.inSeconds.remainder(60))} ثانيه';

// //   String selectedCountry = 'مصر';
// //   return Padding(
// //     padding: const EdgeInsets.symmetric(horizontal: 10),
// //     child: Container(
// //       decoration: BoxDecoration(
// //         color: Colors.brown.shade400,
// //         borderRadius: BorderRadius.circular(20),
// //       ),
// //       width: double.infinity,
// //       padding: const EdgeInsets.all(16.0),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.center,
// //         children: [
// //           Text(
// //             'الوقت المتبقي حتي صلاة $prayerName',
// //             textAlign: TextAlign.center,
// //             style: const TextStyle(
// //               fontSize: 20,
// //               fontWeight: FontWeight.bold,
// //               color: Colors.white,
// //             ),
// //           ),
// //           const SizedBox(height: 8),
// //           Text(
// //             countdownString,
// //             textAlign: TextAlign.center,
// //             style: const TextStyle(
// //               fontSize: 20,
// //               fontWeight: FontWeight.bold,
// //               color: Colors.white,
// //             ),
// //           ),
// //           const SizedBox(height: 8),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.end,
// //             children: [
// //               Text(
// //                 '$selectedCountry ، القاهرة',
// //                 textAlign: TextAlign.center,
// //                 style: const TextStyle(
// //                   fontSize: 18,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.white,
// //                 ),
// //               ),
// //               IconButton(
// //                 onPressed: () {
// //                   showLocationDialog(context); // استدعاء دالة إظهار الـ Dialog
// //                 },
// //                 icon: const Icon(
// //                   color: Colors.white,
// //                   Icons.location_on_sharp,
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     ),
// //   );
// // }

// // // دالة إظهار الـ Dialog
// // void showLocationDialog(BuildContext context) {
// //   showDialog(
// //     context: context,
// //     builder: (BuildContext context) {
// //       return AlertDialog(
// //         title: const Text('اختيار الدولة'),
// //         content: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             ElevatedButton(
// //               onPressed: () {
// //                 Navigator.pop(context); // غلق الـ Dialog الحالي
// //                 showCountrySelectionDialog(
// //                     context); // فتح الـ Dialog الجديد لاختيار الدولة
// //               },
// //               child: const Text('اختر الدولة'),
// //             ),
// //           ],
// //         ),
// //       );
// //     },
// //   );
// // }

// // void showCountrySelectionDialog(BuildContext context) {
// //   List<String> countries = [
// //     'مصر',
// //     'السعودية',
// //     'الجزائر',
// //     'المغرب',
// //     'تونس'
// //   ]; // قائمة الدول
// //   TextEditingController searchController =
// //       TextEditingController(); // للتحكم في البحث

// //   // الانتقال إلى شاشة جديدة تحتوي على Container
// //   Navigator.push(
// //     context,
// //     MaterialPageRoute(
// //       builder: (context) => Scaffold(
// //         appBar: AppBar(
// //           title: const Text('اختر الدولة'),
// //         ),
// //         body: Directionality(
// //           textDirection: TextDirection.rtl,
// //           child: Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Column(
// //               children: [
// //                 TextField(
// //                   controller: searchController,
// //                   onChanged: (value) {
// //                     // إعادة بناء الـ StatefulWidget لعرض النتائج
// //                     (context as Element).reassemble();
// //                   },
// //                   decoration: const InputDecoration(
// //                     labelText: 'ابحث عن الدولة',
// //                     border: OutlineInputBorder(),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 10),
// //                 Expanded(
// //                   child: Builder(
// //                     builder: (context) {
// //                       // تصفية الدول بناءً على البحث
// //                       List<String> filteredCountries = countries
// //                           .where((country) =>
// //                               country.contains(searchController.text))
// //                           .toList();

// //                       return ListView.builder(
// //                         shrinkWrap: true,
// //                         itemCount: filteredCountries.length,
// //                         itemBuilder: (context, index) {
// //                           return ListTile(
// //                             title: Text(filteredCountries[index]),
// //                             onTap: () {
// //                               selectedCountry = filteredCountries[index];

// //                               // تنفيذ العملية عند اختيار الدولة
// //                               print(
// //                                   'تم اختيار الدولة: ${filteredCountries[index]}');
// //                               Navigator.pop(context); // غلق الصفحة بعد الاختيار
// //                             },
// //                           );
// //                         },
// //                       );
// //                     },
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     ),
// //   );
// // }

// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_cubit.dart';

// // class CountdownCard extends StatefulWidget {
// //   final DateTime nextPrayerTime;
// //   final Duration countdown;
// //   final String prayerName;

// //   const CountdownCard({
// //     Key? key,
// //     required this.nextPrayerTime,
// //     required this.countdown,
// //     required this.prayerName,
// //   }) : super(key: key);

// //   @override
// //   _CountdownCardState createState() => _CountdownCardState();
// // }

// // class _CountdownCardState extends State<CountdownCard> {
// //   String selectedCountry = 'مصر';

// //   @override
// //   Widget build(BuildContext context) {
// //     final convert_to_arabic = BlocProvider.of<PrayerTimesCubit>(context);

// //     String countdownString =
// //         '${convert_to_arabic.toArabic(widget.countdown.inHours)} ساعه ${convert_to_arabic.toArabic(widget.countdown.inMinutes.remainder(60))} دقيقه ${convert_to_arabic.toArabic(widget.countdown.inSeconds.remainder(60))} ثانيه';

// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 10),
// //       child: Container(
// //         decoration: BoxDecoration(
// //           color: Colors.brown.shade400,
// //           borderRadius: BorderRadius.circular(20),
// //         ),
// //         width: double.infinity,
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             Text(
// //               'الوقت المتبقي حتي صلاة ${widget.prayerName}',
// //               textAlign: TextAlign.center,
// //               style: const TextStyle(
// //                 fontSize: 20,
// //                 fontWeight: FontWeight.bold,
// //                 color: Colors.white,
// //               ),
// //             ),
// //             const SizedBox(height: 8),
// //             Text(
// //               countdownString,
// //               textAlign: TextAlign.center,
// //               style: const TextStyle(
// //                 fontSize: 20,
// //                 fontWeight: FontWeight.bold,
// //                 color: Colors.white,
// //               ),
// //             ),
// //             const SizedBox(height: 8),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.end,
// //               children: [
// //                 Text(
// //                   '$selectedCountry ، القاهرة',
// //                   textAlign: TextAlign.center,
// //                   style: const TextStyle(
// //                     fontSize: 18,
// //                     fontWeight: FontWeight.bold,
// //                     color: Colors.white,
// //                   ),
// //                 ),
// //                 IconButton(
// //                   onPressed: () {
// //                     showLocationDialog(
// //                         context); // استدعاء دالة إظهار الـ Dialog
// //                   },
// //                   icon: const Icon(
// //                     color: Colors.white,
// //                     Icons.location_on_sharp,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   // دالة إظهار الـ Dialog
// //   void showLocationDialog(BuildContext context) {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: const Text('اختيار الدولة'),
// //           content: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               ElevatedButton(
// //                 onPressed: () {
// //                   Navigator.pop(context); // غلق الـ Dialog الحالي
// //                   showCountrySelectionDialog(
// //                       context); // فتح الـ Dialog الجديد لاختيار الدولة
// //                 },
// //                 child: const Text('اختر الدولة'),
// //               ),
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }

// //   void showCountrySelectionDialog(BuildContext context) {
// //     List<String> countries = [
// //       'مصر',
// //       'السعودية',
// //       'الجزائر',
// //       'المغرب',
// //       'تونس'
// //     ]; // قائمة الدول
// //     TextEditingController searchController =
// //         TextEditingController(); // للتحكم في البحث

// //     // الانتقال إلى شاشة جديدة تحتوي على Container
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         builder: (context) => Scaffold(
// //           appBar: AppBar(
// //             title: const Text('اختر الدولة'),
// //           ),
// //           body: Directionality(
// //             textDirection: TextDirection.rtl,
// //             child: Padding(
// //               padding: const EdgeInsets.all(16.0),
// //               child: Column(
// //                 children: [
// //                   TextField(
// //                     controller: searchController,
// //                     onChanged: (value) {
// //                       (context as Element).reassemble();
// //                     },
// //                     decoration: const InputDecoration(
// //                       labelText: 'ابحث عن الدولة',
// //                       border: OutlineInputBorder(),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 10),
// //                   Expanded(
// //                     child: Builder(
// //                       builder: (context) {
// //                         // تصفية الدول بناءً على البحث
// //                         List<String> filteredCountries = countries
// //                             .where((country) =>
// //                                 country.contains(searchController.text))
// //                             .toList();

// //                         return ListView.builder(
// //                           shrinkWrap: true,
// //                           itemCount: filteredCountries.length,
// //                           itemBuilder: (context, index) {
// //                             return ListTile(
// //                               title: Text(filteredCountries[index]),
// //                               onTap: () {
// //                                 setState(() {
// //                                   selectedCountry = filteredCountries[index];
// //                                 });
// //                                 // تنفيذ العملية عند اختيار الدولة
// //                                 print(
// //                                     'تم اختيار الدولة: ${filteredCountries[index]}');
// //                                 Navigator.pop(
// //                                     context); // غلق الصفحة بعد الاختيار
// //                               },
// //                             );
// //                           },
// //                         );
// //                       },
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_cubit.dart';

// class CountdownCard extends StatefulWidget {
//   final DateTime nextPrayerTime;
//   final Duration countdown;
//   final String prayerName;

//   const CountdownCard({
//     Key? key,
//     required this.nextPrayerTime,
//     required this.countdown,
//     required this.prayerName,
//   }) : super(key: key);

//   @override
//   _CountdownCardState createState() => _CountdownCardState();
// }

// class _CountdownCardState extends State<CountdownCard> {
//   String selectedCountry = 'مصر';
//   String selectedProvince = 'القاهرة'; // Default province

//   @override
//   Widget build(BuildContext context) {
//     final convert_to_arabic = BlocProvider.of<PrayerTimesCubit>(context);

//     String countdownString =
//         '${convert_to_arabic.toArabic(widget.countdown.inHours)} ساعه ${convert_to_arabic.toArabic(widget.countdown.inMinutes.remainder(60))} دقيقه ${convert_to_arabic.toArabic(widget.countdown.inSeconds.remainder(60))} ثانيه';

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.brown.shade400,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         width: double.infinity,
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               'الوقت المتبقي حتي صلاة ${widget.prayerName}',
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               countdownString,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Text(
//                   '$selectedProvince ، $selectedCountry',
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     showLocationDialog(context);
//                   },
//                   icon: const Icon(
//                     color: Colors.white,
//                     Icons.location_on_sharp,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // دالة إظهار الـ Dialog
//   void showLocationDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text(
//             'اختيار الدولة',
//             textAlign: TextAlign.end,
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.brown,
//                 ),
//                 onPressed: () {
//                   Navigator.pop(context); // غلق الـ Dialog الحالي
//                   showCountrySelectionDialog(
//                       context); // فتح الـ Dialog لاختيار الدولة
//                 },
//                 child: const Text(
//                   'اختر الدولة',
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void showCountrySelectionDialog(BuildContext context) {
//     List<String> countries = [
//       'مصر',
//       'السعودية',
//       'الجزائر',
//       'المغرب',
//       'تونس'
//     ]; // قائمة الدول
//     TextEditingController searchController =
//         TextEditingController(); // للتحكم في البحث

//     // الانتقال إلى شاشة جديدة تحتوي على Container
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => Scaffold(
//           appBar: AppBar(
//             title: const Text('اختر الدولة'),
//           ),
//           body: Directionality(
//             textDirection: TextDirection.rtl,
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   TextField(
//                     controller: searchController,
//                     onChanged: (value) {
//                       (context as Element).reassemble();
//                     },
//                     decoration: const InputDecoration(
//                       labelText: 'ابحث عن الدولة',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Expanded(
//                     child: Builder(
//                       builder: (context) {
//                         // تصفية الدول بناءً على البحث
//                         List<String> filteredCountries = countries
//                             .where((country) =>
//                                 country.contains(searchController.text))
//                             .toList();

//                         return ListView.builder(
//                           shrinkWrap: true,
//                           itemCount: filteredCountries.length,
//                           itemBuilder: (context, index) {
//                             return ListTile(
//                               title: Text(filteredCountries[index]),
//                               onTap: () {
//                                 setState(() {
//                                   selectedCountry = filteredCountries[index];
//                                 });
//                                 // Call the function to show province selection
//                                 showProvinceSelectionContainer(
//                                     context, filteredCountries[index]);
//                               },
//                             );
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

// // New method to show province selection in a Container
//   void showProvinceSelectionContainer(BuildContext context, String country) {
//     List<String> provinces = getProvincesForCountry(country);

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('اختيار المحافظة'),
//           content: Container(
//             width: double.maxFinite,
//             height: 300, // Set a height as needed
//             child: Column(
//               children: [
//                 const Text('اختر المحافظة',
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 10),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: provinces.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: Text(provinces[index]),
//                         onTap: () {
//                           setState(() {
//                             selectedProvince = provinces[index];
//                             Navigator.pop(context);
//                           });
//                           Navigator.pop(context);
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   List<String> getProvincesForCountry(String country) {
//     switch (country) {
//       case 'مصر':
//         return ['القاهرة', 'الجيزة', 'الإسكندرية', 'الدقهلية'];
//       case 'السعودية':
//         return ['الرياض', 'جدة', 'مكة', 'المدينة'];
//       case 'الجزائر':
//         return ['الجزائر العاصمة', 'وهران', 'قسنطينة'];
//       case 'المغرب':
//         return ['الرباط', 'الدار البيضاء', 'فاس'];
//       case 'تونس':
//         return ['تونس العاصمة', 'سوسة', 'صفاقس'];
//       default:
//         return [];
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/prayer_times_bloc/prayer_times_cubit.dart';

class CountdownCard extends StatefulWidget {
  final DateTime nextPrayerTime;
  final Duration countdown;
  final String prayerName;
  final String countryName;

  const CountdownCard(
      {Key? key,
      required this.nextPrayerTime,
      required this.countdown,
      required this.prayerName,
      required this.countryName})
      : super(key: key);

  @override
  _CountdownCardState createState() => _CountdownCardState();
}

class _CountdownCardState extends State<CountdownCard> {
  String selectedCountry = 'Egypt'; // Default country in English
  String selectedProvince = 'Qalyubia'; // Default province in English

  @override
  Widget build(BuildContext context) {
    final convertToArabic = BlocProvider.of<PrayerTimesCubit>(context);

    String countdownString =
        '${convertToArabic.toArabic(widget.countdown.inHours)} ساعه ${convertToArabic.toArabic(widget.countdown.inMinutes.remainder(60))} دقيقه ${convertToArabic.toArabic(widget.countdown.inSeconds.remainder(60))} ثانيه';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.brown.shade400,
          borderRadius: BorderRadius.circular(20),
        ),
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'الوقت المتبقي حتي صلاة ${widget.prayerName}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              countdownString,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.07),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Text(
            //       '$selectedProvince ، $selectedCountry',
            //       textAlign: TextAlign.center,
            //       style: const TextStyle(
            //         fontSize: 18,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.white,
            //       ),
            //     ),
            //     IconButton(
            //       onPressed: () {
            //         showLocationDialog(context);
            //       },
            //       icon: const Icon(
            //         color: Colors.white,
            //         Icons.location_on_sharp,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

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
                  showCountrySelectionDialog(
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

  void showCountrySelectionDialog(BuildContext context) {
    List<String> countries = [
      'Egypt',
      'Saudi Arabia',
      'Algeria',
      'Morocco',
      'Tunisia'
    ]; // List of countries in English
    TextEditingController searchController =
        TextEditingController(); // For search control

    // Navigate to a new screen containing a Container
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('اختر الدولة'),
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: searchController,
                    onChanged: (value) {
                      (context as Element).reassemble();
                    },
                    decoration: const InputDecoration(
                      labelText: 'ابحث عن الدولة',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        // Filter countries based on search
                        List<String> filteredCountries = countries
                            .where((country) => country
                                .toLowerCase()
                                .contains(searchController.text.toLowerCase()))
                            .toList();

                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: filteredCountries.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(filteredCountries[index]),
                              onTap: () {
                                setState(() {
                                  selectedCountry = filteredCountries[index];
                                });
                                // Call the function to show province selection
                                showProvinceSelectionContainer(
                                    context, filteredCountries[index]);
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showProvinceSelectionContainer(BuildContext context, String country) {
    List<String> provinces = getProvincesForCountry(country);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('اختيار المحافظة'),
          content: Container(
            width: double.maxFinite,
            height: 300, // Set a height as needed
            child: Column(
              children: [
                const Text('اختر المحافظة',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: provinces.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(provinces[index]),
                        onTap: () {
                          setState(() {
                            selectedProvince = provinces[index];
                            Navigator.pop(context);
                          });
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<String> getProvincesForCountry(String country) {
    switch (country) {
      case 'Egypt':
        return ['Cairo', 'Giza', 'Alexandria', 'Dakahlia'];
      case 'Saudi Arabia':
        return ['Riyadh', 'Jeddah', 'Mecca', 'Medina'];
      case 'Algeria':
        return ['Algiers', 'Oran', 'Constantine'];
      case 'Morocco':
        return ['Rabat', 'Casablanca', 'Fes'];
      case 'Tunisia':
        return ['Tunis', 'Sousse', 'Sfax'];
      default:
        return [];
    }
  }
}
