import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_app_new_version_22/cubit/quran%20audio%20cubit/reciters%20cubit/reciters_cubit.dart';

class RecitersTextField extends StatelessWidget {
  const RecitersTextField({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 10,
      ),
      child: TextField(
        cursorColor: Colors.green,
        controller: searchController,
        onChanged: (query) {
          context.read<RecitersCubit>().filterReciters(query);
        },
        style: const TextStyle(fontSize: 16),
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          hintText: "بحث عن القارئ",
          hintTextDirection: TextDirection.rtl,
          suffixIcon: Icon(Icons.search,
              color: Colors.green[700], size: 22), // تصغير الأيقونة
          contentPadding: const EdgeInsets.symmetric(
              vertical: 8.0, horizontal: 10.0), // تقليل الحشوة الداخلية
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // تصغير الحواف
            borderSide: const BorderSide(color: Colors.green),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.green[700]!, width: 2),
          ),
        ),
      ),
    );
  }
}
