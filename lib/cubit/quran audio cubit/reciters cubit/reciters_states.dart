import 'package:equatable/equatable.dart';

abstract class RecitersState extends Equatable {
  const RecitersState();

  @override
  List<Object?> get props => [];
}

class RecitersInitial extends RecitersState {}

class RecitersLoading extends RecitersState {}

class RecitersLoaded extends RecitersState {
  final List<Map<String, dynamic>> reciters;
  RecitersLoaded(this.reciters);

  @override
  List<Object?> get props => [reciters];
}

class RecitersError extends RecitersState {
  final String message;
  RecitersError(this.message);

  @override
  List<Object?> get props => [message];
}

class RecitersFiltered extends RecitersState {
  final List<Map<String, dynamic>> filteredReciters;
  RecitersFiltered(this.filteredReciters);

  @override
  List<Object?> get props => [filteredReciters];
}
