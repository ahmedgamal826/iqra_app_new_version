// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:iqra_app_new_version_22/cubit/azkar%20bloc/azkar_cubit.dart';
// import 'package:iqra_app_new_version_22/cubit/azkar%20bloc/azkar_states.dart';
// import 'package:iqra_app_new_version_22/models/sectiom_model.dart';
// import 'package:iqra_app_new_version_22/widgets/azkar_widgets/section_azkar_item.dart';

// class AzkarHomePage extends StatelessWidget {
//   const AzkarHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Call the Cubit's method to load the initial data if needed
//     final azkarCubit = context.read<AzkarCubit>();
//     azkarCubit.loadSectionsFromFile();

//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.brown,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 10),
//             child: Image.asset(
//               'assets/images/dua-hands.png',
//               color: Colors.white,
//               width: 45,
//             ),
//           ),
//         ],
//         title: const Text(
//           "أذكار المسلم",
//           style: TextStyle(
//               fontFamily: 'Tajawal',
//               fontSize: 30,
//               color: Colors.white,
//               fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: BlocListener<AzkarCubit, AzkarState>(
//         listener: (context, state) {
//           if (state is AzkarError) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('Error: ${state.message}')),
//             );
//           }
//         },
//         child: BlocBuilder<AzkarCubit, AzkarState>(
//           builder: (context, state) {
//             if (state is AzkarLoading) {
//               return const Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.brown,
//                 ),
//               );
//             } else if (state is AzkarSectionsLoaded) {
//               return Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: ListView.builder(
//                   itemBuilder: (context, index) => buildSectionItem(
//                       model: state.sections[index], context: context),
//                   itemCount: state.sections.length,
//                   physics: const BouncingScrollPhysics(),
//                 ),
//               );
//             } else if (state is AzkarError) {
//               return Center(child: Text('Error: ${state.message}'));
//             }

//             final cachedData = BlocProvider.of<AzkarCubit>(context);

//             // Check if cached data is available and show it
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
//                   final List<AzkarModel> sections = jsonList
//                       .map((json) => AzkarModel.fromJson(json))
//                       .toList();

//                   return Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: ListView.builder(
//                       itemBuilder: (context, index) => buildSectionItem(
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
import 'package:iqra_app_new_version_22/cubit/azkar%20bloc/azkar_cubit.dart';
import 'package:iqra_app_new_version_22/cubit/azkar%20bloc/azkar_states.dart';
import 'package:iqra_app_new_version_22/models/sectiom_model.dart';
import 'package:iqra_app_new_version_22/widgets/azkar_widgets/section_azkar_item.dart';

class AzkarHomePage extends StatelessWidget {
  const AzkarHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Call the Cubit's method to load the initial data if needed
    final azkarCubit = context.read<AzkarCubit>();
    azkarCubit.loadSectionsFromFile();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.brown,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              'assets/images/dua-hands.png',
              color: Colors.white,
              width: 45,
            ),
          ),
        ],
        title: const Text(
          "أذكار المسلم",
          style: TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocListener<AzkarCubit, AzkarState>(
        listener: (context, state) {
          if (state is AzkarError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        child: BlocBuilder<AzkarCubit, AzkarState>(
          builder: (context, state) {
            if (state is AzkarLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.brown,
                ),
              );
            } else if (state is AzkarSectionsLoaded) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 10.0, // Space between columns
                    mainAxisSpacing: 10.0, // Space between rows
                    childAspectRatio: 1.0, // Aspect ratio for grid items
                  ),
                  itemBuilder: (context, index) => buildSectionItem(
                      model: state.sections[index], context: context),
                  itemCount: state.sections.length,
                ),
              );
            } else if (state is AzkarError) {
              return Center(child: Text('Error: ${state.message}'));
            }

            final cachedData = BlocProvider.of<AzkarCubit>(context);

            // Check if cached data is available and show it
            return FutureBuilder<String?>(
              future: cachedData.getCachedData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.brown,
                    ),
                  );
                } else if (snapshot.hasData && snapshot.data != null) {
                  final List<dynamic> jsonList = json.decode(snapshot.data!);
                  final List<AzkarModel> sections = jsonList
                      .map((json) => AzkarModel.fromJson(json))
                      .toList();

                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        crossAxisSpacing: 10.0, // Space between columns
                        mainAxisSpacing: 10.0, // Space between rows
                        childAspectRatio: 1.0, // Aspect ratio for grid items
                      ),
                      itemBuilder: (context, index) => buildSectionItem(
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
