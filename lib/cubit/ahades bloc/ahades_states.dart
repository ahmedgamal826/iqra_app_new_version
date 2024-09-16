import 'package:equatable/equatable.dart';
import 'package:iqra_app_new_version_22/models/ahades_details_model.dart';
import 'package:iqra_app_new_version_22/models/ahades_model.dart';

abstract class AhadesStates extends Equatable {
  const AhadesStates();
  @override
  List<Object> get props => [];
}

class AhadesInitial extends AhadesStates {}

class AhadesLoading extends AhadesStates {}

class AhadesSectionsLoaded extends AhadesStates {
  final List<AhadesModel> Ahadessections;
  const AhadesSectionsLoaded({required this.Ahadessections});
  @override
  List<Object> get props => [Ahadessections];
}

class AhadesSectionDetailsLoaded extends AhadesStates {
  final List<AhadesDetailsModel> sectionDetails;
  const AhadesSectionDetailsLoaded({required this.sectionDetails});
  @override
  List<Object> get props => [sectionDetails];
}

class AhadesError extends AhadesStates {
  final String message;
  const AhadesError({required this.message});
  @override
  List<Object> get props => [message];
}
