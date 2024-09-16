import 'package:equatable/equatable.dart';
import 'package:iqra_app_new_version_22/models/stories_details_model.dart';
import 'package:iqra_app_new_version_22/models/stories_model.dart';

abstract class StoriesStates extends Equatable {
  const StoriesStates();
  @override
  List<Object> get props => [];
}

class StoriesInitial extends StoriesStates {}

class StoriesLoading extends StoriesStates {}

class StoriesSectionsLoaded extends StoriesStates {
  final List<StoriesModel> Storiessections;
  const StoriesSectionsLoaded({required this.Storiessections});
  @override
  List<Object> get props => [Storiessections];
}

class StoriesSectionDetailsLoaded extends StoriesStates {
  final List<StoriesDetailsModel> sectionDetails;
  const StoriesSectionDetailsLoaded({required this.sectionDetails});
  @override
  List<Object> get props => [sectionDetails];
}

class StoriesError extends StoriesStates {
  final String message;
  const StoriesError({required this.message});
  @override
  List<Object> get props => [message];
}
