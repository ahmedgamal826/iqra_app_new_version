// // quran_page_cubit.dart
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:iqra_app_new_version_22/cubit/quran%20bloc/quran_states.dart';

// class QuranPageCubit extends Cubit<QuranPageState> {
//   QuranPageCubit() : super(QuranPageInitial());

//   void loadData(dynamic suraJsonData) {
//     emit(QuranPageLoading());

//     // Example logic to load data
//     final List<int> pageNumbers = []; // Load page numbers from suraJsonData
//     final dynamic filteredData = {}; // Load filtered data from suraJsonData

//     emit(QuranPageLoaded(
//       pageNumbers: pageNumbers,
//       filteredData: filteredData,
//       ayaFiltered: null, // Initialize with null or empty if not applicable
//     ));
//   }

//   void search(String query, dynamic suraJsonData) {
//     // Perform search operation here

//     // For demonstration, we'll assume we get some result
//     final dynamic ayaFiltered = {}; // Example search results

//     emit(QuranPageLoaded(
//       pageNumbers: [], // Update with relevant page numbers
//       filteredData: {}, // Update with relevant filtered data
//       ayaFiltered: ayaFiltered, // Update with search results
//     ));
//   }

//   Future<void> saveVerse(int pageNumber) async {
//     // Save verse operation here
//   }
// }
