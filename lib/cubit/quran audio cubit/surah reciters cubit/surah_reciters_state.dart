abstract class SurahRecitersState {}

class SurahRecitersInitial extends SurahRecitersState {}

class SurahRecitersLoaded extends SurahRecitersState {
  final List<String> surahs;
  SurahRecitersLoaded(this.surahs);
}

class SurahRecitersError extends SurahRecitersState {
  final String message;
  SurahRecitersError(this.message);
}
