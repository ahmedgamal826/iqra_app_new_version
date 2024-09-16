// // quran_page_state.dart
// import 'package:equatable/equatable.dart';

// abstract class QuranPageState extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class QuranPageInitial extends QuranPageState {}

// class QuranPageLoading extends QuranPageState {}

// class QuranPageLoaded extends QuranPageState {
//   final List<int> pageNumbers;
//   final dynamic filteredData;
//   final dynamic ayaFiltered;

//   QuranPageLoaded({
//     required this.pageNumbers,
//     required this.filteredData,
//     this.ayaFiltered,
//   });

//   @override
//   List<Object?> get props => [pageNumbers, filteredData, ayaFiltered];
// }

// class QuranPageError extends QuranPageState {
//   final String message;

//   QuranPageError({required this.message});

//   @override
//   List<Object?> get props => [message];
// }
