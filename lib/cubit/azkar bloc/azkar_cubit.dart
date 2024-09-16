import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:iqra_app_new_version_22/cubit/azkar%20bloc/azkar_states.dart';
import 'package:iqra_app_new_version_22/models/section_detail_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:iqra_app_new_version_22/models/sectiom_model.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit() : super(AzkarInitial()) {
    _loadInitialData();
  }

  List<AzkarModel> sections = [];

  Future<void> _loadInitialData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cachedData = prefs.getString('sections_data');

      if (cachedData != null) {
        // البيانات مخزنة في SharedPreferences، تحميلها
        final List<dynamic> jsonList = json.decode(cachedData);
        sections = jsonList.map((json) => AzkarModel.fromJson(json)).toList();
        emit(AzkarSectionsLoaded(sections: sections));
      } else {
        // البيانات غير متاحة، تحميلها من المصدر
        loadSectionsFromFile();
      }
    } catch (error) {
      emit(AzkarError(message: 'Failed to load sections: ${error.toString()}'));
    }
  }

  Future<void> loadSectionsFromFile() async {
    try {
      emit(AzkarLoading());
      final data =
          await rootBundle.loadString('assets/database/sections_db.json');
      final List<dynamic> jsonList = json.decode(data);
      sections = jsonList.map((json) => AzkarModel.fromJson(json)).toList();

      // حفظ البيانات في SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('sections_data', json.encode(jsonList));

      emit(AzkarSectionsLoaded(sections: sections));
    } catch (error) {
      emit(AzkarError(
          message: 'Failed to load sections from file: ${error.toString()}'));
    }
  }

  // Future<void> _loadInitialData() async {
  //   try {
  //     final prefs = await SharedPreferences.getInstance();
  //     final cachedData = prefs.getString('sections_data');

  //     if (cachedData != null) {
  //       final List<dynamic> jsonList = json.decode(cachedData);
  //       final List<AzkarModel> sections =
  //           jsonList.map((json) => AzkarModel.fromJson(json)).toList();
  //       emit(AzkarSectionsLoaded(sections: sections));
  //     } else {
  //       // Data not available in SharedPreferences, load from source
  //       loadSectionDetails(1);
  //     }
  //   } catch (error) {
  //     emit(AzkarError(message: 'Failed to load sections: ${error.toString()}'));
  //   }
  // }

  Future<void> loadSectionDetails(int sectionId) async {
    try {
      emit(AzkarLoading());
      final data = await rootBundle
          .loadString('assets/database/section_details_db.json');
      final List<dynamic> jsonList = json.decode(data);
      final List<SectionDetailModel> sectionDetails = jsonList
          .map((json) => SectionDetailModel.fromJson(json))
          .where((item) => item.sectionId == sectionId)
          .toList();
      emit(AzkarSectionDetailsLoaded(sectionDetails: sectionDetails));
    } catch (error) {
      emit(AzkarError(
          message: 'Failed to load section details: ${error.toString()}'));
    }
  }

  // get chaced azkar data function
  Future<String?> getCachedData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('sections_data');
  }
}
