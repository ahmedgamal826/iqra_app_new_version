import 'package:equatable/equatable.dart';
import 'package:iqra_app_new_version_22/models/sectiom_model.dart';
import 'package:iqra_app_new_version_22/models/section_detail_model.dart';

abstract class AzkarState extends Equatable {
  const AzkarState();
  @override
  List<Object> get props => [];
}

class AzkarInitial extends AzkarState {}

class AzkarLoading extends AzkarState {}

class AzkarSectionsLoaded extends AzkarState {
  final List<AzkarModel> sections;
  const AzkarSectionsLoaded({required this.sections});
  @override
  List<Object> get props => [sections];
}

class AzkarSectionDetailsLoaded extends AzkarState {
  final List<SectionDetailModel> sectionDetails;
  const AzkarSectionDetailsLoaded({required this.sectionDetails});
  @override
  List<Object> get props => [sectionDetails];
}

class AzkarError extends AzkarState {
  final String message;
  const AzkarError({required this.message});
  @override
  List<Object> get props => [message];
}
