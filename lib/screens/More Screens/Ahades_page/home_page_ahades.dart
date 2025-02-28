// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:iqra_app_new_version_22/cubit/ahades%20bloc/ahades_cubit.dart';
// import 'package:iqra_app_new_version_22/cubit/ahades%20bloc/ahades_states.dart';
// import 'package:iqra_app_new_version_22/models/ahades_model.dart';
// import 'package:iqra_app_new_version_22/widgets/ahades_widgets/section_ahades_item.dart';

// class HomePageAhades extends StatelessWidget {
//   const HomePageAhades({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Call the Cubit's method to load the initial data if needed
//     final ahadesCubit = context.read<AhadesCubit>();
//     ahadesCubit.loadSectionsFromFile(); // تحميل البيانات من الملف

//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(
//           color: Colors.white,
//           size: 30,
//         ),
//         elevation: 0,
//         backgroundColor: Colors.brown,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 10),
//             child: Image.asset(
//               'assets/images/prophet_mosque.png',
//               width: 45,
//             ),
//           ),
//         ],
//         title: const Text(
//           "الأحاديث الشريفة ",
//           style: TextStyle(
//               fontFamily: 'Tajawal',
//               fontSize: 30,
//               color: Colors.white,
//               fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: BlocListener<AhadesCubit, AhadesStates>(
//         listener: (context, state) {
//           if (state is AhadesError) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('Error: ${state.message}')),
//             );
//           }
//         },
//         child: BlocBuilder<AhadesCubit, AhadesStates>(
//           builder: (context, state) {
//             if (state is AhadesLoading) {
//               return const Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.brown,
//                 ),
//               );
//             } else if (state is AhadesSectionsLoaded) {
//               // عرض البيانات المحملة من الملف
//               return Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: ListView.builder(
//                   itemBuilder: (context, index) => buildSectionAhadesItem(
//                       model: state.Ahadessections[index], context: context),
//                   itemCount: state.Ahadessections.length,
//                   physics: const BouncingScrollPhysics(),
//                 ),
//               );
//             } else if (state is AhadesError) {
//               return Center(child: Text('Error: ${state.message}'));
//             }

//             // عرض البيانات المخزنة مؤقتاً في SharedPreferences
//             final cachedData = BlocProvider.of<AhadesCubit>(context);

//             return FutureBuilder<String?>(
//               future: cachedData.getCachedData(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                     child: CircularProgressIndicator(
//                       color: Colors.brown,
//                     ),
//                   );
//                 } else if (snapshot.hasData && snapshot.data != null) {
//                   final List<dynamic> jsonList = json.decode(snapshot.data!);
//                   final List<AhadesModel> sections = jsonList
//                       .map((json) => AhadesModel.fromJson(json))
//                       .toList();

//                   return Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: ListView.builder(
//                       itemBuilder: (context, index) => buildSectionAhadesItem(
//                           model: sections[index], context: context),
//                       itemCount: sections.length,
//                       physics: const BouncingScrollPhysics(),
//                     ),
//                   );
//                 } else {
//                   return const Center(
//                     child: Text('لم يتم العثور على بيانات'),
//                   );
//                 }
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/ahades%20bloc/ahades_cubit.dart';
import 'package:iqra_app_new_version_22/cubit/ahades%20bloc/ahades_states.dart';
import 'package:iqra_app_new_version_22/models/ahades_model.dart';
import 'package:iqra_app_new_version_22/widgets/ahades_widgets/section_ahades_item.dart';

class HomePageAhades extends StatelessWidget {
  const HomePageAhades({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ahadesCubit = context.read<AhadesCubit>();
    ahadesCubit.loadSectionsFromFile();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        elevation: 0,
        backgroundColor: Colors.green,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 10),
        //     child: Image.asset(
        //       'assets/images/prophet_mosque.png',
        //       width: 45,
        //     ),
        //   ),
        // ],
        title: const Text(
          "الأحاديث الشريفة",
          style: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocListener<AhadesCubit, AhadesStates>(
        listener: (context, state) {
          if (state is AhadesError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        child: BlocBuilder<AhadesCubit, AhadesStates>(
          builder: (context, state) {
            if (state is AhadesLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            } else if (state is AhadesSectionsLoaded) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    childAspectRatio: 1, // Adjust as needed
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) => buildSectionAhadesItem(
                      model: state.Ahadessections[index], context: context),
                  itemCount: state.Ahadessections.length,
                ),
              );
            } else if (state is AhadesError) {
              return Center(child: Text('Error: ${state.message}'));
            }

            final cachedData = BlocProvider.of<AhadesCubit>(context);

            return FutureBuilder<String?>(
              future: cachedData.getCachedData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  );
                } else if (snapshot.hasData && snapshot.data != null) {
                  final List<dynamic> jsonList = json.decode(snapshot.data!);
                  final List<AhadesModel> sections = jsonList
                      .map((json) => AhadesModel.fromJson(json))
                      .toList();

                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemBuilder: (context, index) => buildSectionAhadesItem(
                          model: sections[index], context: context),
                      itemCount: sections.length,
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('لم يتم العثور على بيانات'),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
