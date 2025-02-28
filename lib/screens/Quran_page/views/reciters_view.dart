// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:iqra_app_new_version_22/cubit/quran%20audio%20cubit/reciters%20cubit/reciters_cubit.dart';
// import 'package:iqra_app_new_version_22/cubit/quran%20audio%20cubit/reciters%20cubit/reciters_states.dart';
// import 'package:iqra_app_new_version_22/widgets/quran%20widgets/error_connect_wifi_notification.dart';
// import 'package:iqra_app_new_version_22/widgets/quran%20widgets/no_result_widget.dart';
// import 'package:iqra_app_new_version_22/widgets/quran%20widgets/reciters_list_view.dart';
// import 'package:iqra_app_new_version_22/widgets/quran%20widgets/reciters_text_field.dart';

// class RecitersPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => RecitersCubit()..fetchReciters(),
//       child: RecitersView(),
//     );
//   }
// }

// class RecitersView extends StatelessWidget {
//   final TextEditingController searchController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.white),
//         title: const Text(
//           "اختر القارئ",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//             fontSize: 25,
//           ),
//         ),
//         backgroundColor: Colors.green,
//         centerTitle: true,
//         elevation: 5,
//       ),
//       body: Column(
//         children: [
//           RecitersTextField(searchController: searchController),
//           Expanded(
//             child: BlocBuilder<RecitersCubit, RecitersState>(
//               builder: (context, state) {
//                 if (state is RecitersLoading) {
//                   return const Center(
//                     child: CircularProgressIndicator(
//                       color: Colors.green,
//                     ),
//                   );
//                 } else if (state is RecitersLoaded ||
//                     state is RecitersFiltered) {
//                   final reciters = state is RecitersLoaded
//                       ? state.reciters
//                       : (state as RecitersFiltered).filteredReciters;

//                   return reciters.isEmpty
//                       ? const NoResultWidget()
//                       : RecitersListView(reciters: reciters);
//                 } else if (state is RecitersError) {
//                   return const Stack(
//                     children: [
//                       ErrorNotification(
//                         message: '',
//                       ),
//                     ],
//                   );
//                 }
//                 return Container();
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
