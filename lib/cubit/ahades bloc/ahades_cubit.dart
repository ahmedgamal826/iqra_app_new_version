// import 'package:bloc/bloc.dart';
// import 'package:flutter/services.dart';
// import 'package:iqra_app_new_version_22/cubit/ahades%20bloc/ahades_states.dart';
// import 'package:iqra_app_new_version_22/models/ahades_details_model.dart';
// import 'package:iqra_app_new_version_22/models/ahades_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';

// class AhadesCubit extends Cubit<AhadesStates> {
//   AhadesCubit() : super(AhadesInitial()) {
//     _loadInitialData();
//   }

//   List<AhadesModel> sections = [];

//   Future<void> _loadInitialData() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final cachedData = prefs.getString('sections_data');

//       if (cachedData != null) {
//         // البيانات مخزنة في SharedPreferences، تحميلها
//         final List<dynamic> jsonList = json.decode(cachedData);
//         sections = jsonList.map((json) => AhadesModel.fromJson(json)).toList();
//         emit(AhadesSectionsLoaded(Ahadessections: sections));
//       } else {
//         // البيانات غير متاحة، تحميلها من المصدر
//         loadSectionsFromFile();
//       }
//     } catch (error) {
//       emit(
//           AhadesError(message: 'Failed to load sections: ${error.toString()}'));
//     }
//   }

//   Future<void> loadSectionsFromFile() async {
//     try {
//       emit(AhadesLoading());
//       final data =
//           await rootBundle.loadString('assets/database/ahades_db.json');
//       final List<dynamic> jsonList = json.decode(data);
//       sections = jsonList.map((json) => AhadesModel.fromJson(json)).toList();

//       // حفظ البيانات في SharedPreferences
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setString('sections_data', json.encode(jsonList));

//       emit(AhadesSectionsLoaded(Ahadessections: sections));
//     } catch (error) {
//       emit(AhadesError(
//           message: 'Failed to load sections from file: ${error.toString()}'));
//     }
//   }

//   Future<void> loadSectionAhadesDetails(int sectionId) async {
//     try {
//       emit(AhadesLoading());
//       final data =
//           await rootBundle.loadString('assets/database/ahades_details_db.json');
//       final List<dynamic> jsonList = json.decode(data);
//       final List<AhadesDetailsModel> sectionDetails = jsonList
//           .map((json) => AhadesDetailsModel.fromJson(json))
//           .where((item) => item.sectionId == sectionId)
//           .toList();

//       emit(AhadesSectionDetailsLoaded(sectionDetails: sectionDetails));
//     } catch (error) {
//       emit(AhadesError(
//           message: 'Failed to load section details: ${error.toString()}'));
//     }
//   }

//   // دالة للحصول على البيانات المخزنة مؤقتاً
//   Future<String?> getCachedData() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString('sections_data');
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:iqra_app_new_version_22/cubit/ahades%20bloc/ahades_states.dart';
import 'package:iqra_app_new_version_22/models/ahades_details_model.dart';
import 'package:iqra_app_new_version_22/models/ahades_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AhadesCubit extends Cubit<AhadesStates> {
  AhadesCubit() : super(AhadesInitial()) {
    _loadInitialData();
  }

  List<AhadesModel> sections = [];

  Future<void> _loadInitialData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cachedData = prefs.getString('sections_data');

      if (cachedData != null) {
        // البيانات مخزنة في SharedPreferences، تحميلها
        final List<dynamic> jsonList = json.decode(cachedData);
        sections = jsonList.map((json) => AhadesModel.fromJson(json)).toList();
        emit(AhadesSectionsLoaded(Ahadessections: sections));
      } else {
        // البيانات غير متاحة، تحميلها من الملف
        await loadSectionsFromFile();
      }
    } catch (error) {
      emit(
          AhadesError(message: 'Failed to load sections: ${error.toString()}'));
    }
  }

  // دالة لتحميل أي ملف JSON من مجلد الأصول
  Future<List<dynamic>> _loadJsonFile(String fileName) async {
    try {
      final data = await rootBundle.loadString('assets/database/$fileName');
      return json.decode(data);
    } catch (error) {
      throw Exception('Failed to load $fileName: ${error.toString()}');
    }
  }

  Future<void> loadSectionsFromFile() async {
    try {
      emit(AhadesLoading());
      // استدعاء الدالة لتحميل ملف sections
      final List<dynamic> jsonList = await _loadJsonFile('ahades_db.json');
      sections = jsonList.map((json) => AhadesModel.fromJson(json)).toList();

      // حفظ البيانات في SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('sections_data', json.encode(jsonList));

      emit(AhadesSectionsLoaded(Ahadessections: sections));
    } catch (error) {
      emit(AhadesError(
          message: 'Failed to load sections from file: ${error.toString()}'));
    }
  }

  Future<void> loadSectionAhadesDetails(int sectionId) async {
    try {
      emit(AhadesLoading());

      // استدعاء الدالة لتحميل ملف التفاصيل
      final List<dynamic> jsonList =
          await _loadJsonFile('ahades_details_db.json');

      final List<AhadesDetailsModel> sectionDetails = jsonList
          .map((json) => AhadesDetailsModel.fromJson(json))
          .where((item) => item.sectionId == sectionId)
          .toList();

      emit(AhadesSectionDetailsLoaded(sectionDetails: sectionDetails));
    } catch (error) {
      emit(AhadesError(
          message: 'Failed to load section details: ${error.toString()}'));
    }
  }

  // مثال لتحميل ملف إضافي عند الحاجة
  Future<void> loadExtraData(String fileName) async {
    try {
      emit(AhadesLoading());

      // تحميل ملف JSON بناءً على الاسم المدخل
      final List<dynamic> jsonList = await _loadJsonFile(fileName);

      // التعامل مع البيانات حسب الحاجة
      // مثلاً، يمكنك التعامل مع هذا الملف بشكل مختلف بناءً على محتواه

      emit(AhadesExtraDataLoaded(sectionExtraDetails: jsonList));
    } catch (error) {
      emit(AhadesError(
          message:
              'Failed to load extra data from $fileName: ${error.toString()}'));
    }
  }

  // دالة للحصول على البيانات المخزنة مؤقتاً
  Future<String?> getCachedData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('sections_data');
  }
}
