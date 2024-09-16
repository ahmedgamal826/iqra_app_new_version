import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:iqra_app_new_version_22/cubit/stories%20bloc/stories_states.dart';
import 'package:iqra_app_new_version_22/models/ahades_details_model.dart';
import 'package:iqra_app_new_version_22/models/ahades_model.dart';
import 'package:iqra_app_new_version_22/models/stories_details_model.dart';
import 'package:iqra_app_new_version_22/models/stories_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StoriesCubit extends Cubit<StoriesStates> {
  StoriesCubit() : super(StoriesInitial()) {
    _loadInitialData();
  }

  List<StoriesModel> sections = [];

  Future<void> _loadInitialData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cachedData = prefs.getString('sections_data');

      if (cachedData != null) {
        // البيانات مخزنة في SharedPreferences، تحميلها
        final List<dynamic> jsonList = json.decode(cachedData);
        sections = jsonList.map((json) => StoriesModel.fromJson(json)).toList();
        emit(StoriesSectionsLoaded(Storiessections: sections));
      } else {
        // البيانات غير متاحة، تحميلها من المصدر
        loadSectionsFromFile();
      }
    } catch (error) {
      emit(StoriesError(
          message: 'Failed to load sections: ${error.toString()}'));
    }
  }

  Future<void> loadSectionsFromFile() async {
    try {
      emit(StoriesLoading());
      final data =
          await rootBundle.loadString('assets/database/stories_db.json');
      final List<dynamic> jsonList = json.decode(data);
      sections = jsonList.map((json) => StoriesModel.fromJson(json)).toList();

      // حفظ البيانات في SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('sections_data', json.encode(jsonList));

      emit(StoriesSectionsLoaded(Storiessections: sections));
    } catch (error) {
      emit(StoriesError(
          message: 'Failed to load sections from file: ${error.toString()}'));
    }
  }

  Future<void> loadSectionStoriesDetails(int sectionId) async {
    try {
      emit(StoriesLoading());
      final data = await rootBundle
          .loadString('assets/database/stories_db_details.json');
      final List<dynamic> jsonList = json.decode(data);
      final List<StoriesDetailsModel> sectionDetails = jsonList
          .map((json) => StoriesDetailsModel.fromJson(json))
          .where((item) => item.sectionId == sectionId)
          .toList();

      emit(StoriesSectionDetailsLoaded(sectionDetails: sectionDetails));
    } catch (error) {
      emit(StoriesError(
          message: 'Failed to load section details: ${error.toString()}'));
    }
  }

  Future<String?> getCachedData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('sections_data');
  }
}
