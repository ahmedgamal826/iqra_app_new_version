// import 'package:flutter/material.dart';

// class SearchTextField extends StatefulWidget {
//   SearchTextField(
//       {required this.filterdData,
//       required this.suraJsonData,
//       required this.pageNumbers,
//       required this.ayaFiltered,
//       required this.SearchSurahController,
//       required this.onChanged});

//   var filterdData;
//   var suraJsonData;
//   List<int> pageNumbers;
//   var ayaFiltered;
//   var SearchSurahController;
//   void Function(String)? onChanged;

//   @override
//   State<SearchTextField> createState() => _SearchTextFieldState();
// }

// class _SearchTextFieldState extends State<SearchTextField> {
//   @override
//   Widget build(BuildContext context) {
//     var searchQuery = "";

//     return Padding(
//       padding: const EdgeInsets.all(15),
//       child: SizedBox(
//         height: 50,
//         child: TextField(
//           textDirection: TextDirection.rtl,
//           controller: widget.SearchSurahController,
//           onChanged: widget.onChanged,
//           cursorColor: Colors.black,
//           style: const TextStyle(color: Color.fromARGB(190, 0, 0, 0)),
//           decoration: const InputDecoration(
//             hintText: ' ابحث عن سورة أو صفحة أو آية',
//             hintTextDirection: TextDirection.rtl,
//             focusColor: Colors.red,
//             hintStyle: TextStyle(),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//               borderSide: BorderSide(color: Colors.black),
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/globalhelpers/constants.dart';
import 'package:iqra_app_new_version_22/widgets/drawer_widgets/provider_brightness.dart';
import 'package:provider/provider.dart';

class SearchTextField extends StatefulWidget {
  SearchTextField({
    required this.filterdData,
    required this.suraJsonData,
    required this.pageNumbers,
    required this.ayaFiltered,
    required this.SearchSurahController,
    required this.onChanged,
  });

  final dynamic filterdData;
  final dynamic suraJsonData;
  final List<int> pageNumbers;
  final dynamic ayaFiltered;
  final TextEditingController SearchSurahController;
  final void Function(String)? onChanged;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  void performSearch(BuildContext context) {
    // بمجرد الانتهاء من البحث، استدعي الدالة التالية لإخفاء لوحة المفاتيح
    widget.SearchSurahController.clear(); // مسح حقل البحث
    FocusScope.of(context).unfocus(); // إلغاء التركيز لإخفاء لوحة المفاتيح
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<providerBrightness>(
      builder: (context, brightness, child) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            height: 50,
            child: TextField(
              textDirection: TextDirection.rtl,
              controller: widget.SearchSurahController,
              onChanged: (value) {
                widget.onChanged!(
                    value); // استدعاء onChanged الممررة إليها القيمة
              },
              onSubmitted: (value) => performSearch(
                  context), // استدعاء performSearch عند الضغط على Enter
              cursorColor: brightness.isDark ? Colors.white : Colors.black,
              style: TextStyle(
                color: brightness.isDark
                    ? Colors.white
                    : const Color.fromARGB(190, 0, 0, 0),
              ),
              decoration: InputDecoration(
                hintText: ' ابحث عن سورة أو صفحة أو آية',
                hintTextDirection: TextDirection.rtl,
                focusColor: Colors.red,
                hintStyle: TextStyle(
                  color: brightness.isDark ? Colors.white : blackColor,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: brightness.isDark ? Colors.white : blackColor,
                  ),
                  onPressed: () => performSearch(
                      context), // استدعاء performSearch عند الضغط على الأيقونة
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: brightness.isDark ? Colors.white : blackColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
