import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/Quran_page/views/widgets/drawer_widgets/provider_brightness.dart';
import 'package:provider/provider.dart';

class PartIndicator extends StatelessWidget {
  final int index;

  PartIndicator(this.index);

  @override
  Widget build(BuildContext context) {
    String getPartText(int pageIndex) {
      if (pageIndex >= 1 && pageIndex <= 21) {
        return 'الجزء الأول';
      } else if (pageIndex >= 22 && pageIndex <= 41) {
        return 'الجزء الثاني';
      } else if (pageIndex >= 42 && pageIndex <= 61) {
        return 'الجزء الثالث';
      } else if (pageIndex >= 62 && pageIndex <= 81) {
        return 'الجزء الرابع';
      } else if (pageIndex >= 82 && pageIndex <= 101) {
        return 'الجزء الخامس';
      } else if (pageIndex >= 102 && pageIndex <= 121) {
        return 'الجزء السادس';
      } else if (pageIndex >= 122 && pageIndex <= 141) {
        return 'الجزء السابع';
      } else if (pageIndex >= 142 && pageIndex <= 161) {
        return 'الجزء الثامن';
      } else if (pageIndex >= 162 && pageIndex <= 181) {
        return 'الجزء التاسع';
      } else if (pageIndex >= 182 && pageIndex <= 201) {
        return 'الجزء العاشر';
      } else if (pageIndex >= 202 && pageIndex <= 221) {
        return 'الجزء الحادي عشر';
      } else if (pageIndex >= 222 && pageIndex <= 241) {
        return 'الجزء الثاني عشر';
      } else if (pageIndex >= 242 && pageIndex <= 261) {
        return 'الجزء الثالث عشر';
      } else if (pageIndex >= 262 && pageIndex <= 281) {
        return 'الجزء الرابع عشر';
      } else if (pageIndex >= 282 && pageIndex <= 301) {
        return 'الجزء الخامس عشر';
      } else if (pageIndex >= 302 && pageIndex <= 321) {
        return 'الجزء السادس عشر';
      } else if (pageIndex >= 322 && pageIndex <= 341) {
        return 'الجزء السابع عشر';
      } else if (pageIndex >= 342 && pageIndex <= 361) {
        return 'الجزء الثامن عشر';
      } else if (pageIndex >= 362 && pageIndex <= 381) {
        return 'الجزء التاسع عشر';
      } else if (pageIndex >= 382 && pageIndex <= 401) {
        return 'الجزء العشرون';
      } else if (pageIndex >= 402 && pageIndex <= 421) {
        return 'الجزء الواحد والعشرون';
      } else if (pageIndex >= 422 && pageIndex <= 441) {
        return 'الجزء الثاني والعشرون';
      } else if (pageIndex >= 442 && pageIndex <= 461) {
        return 'الجزء الثالث والعشرون';
      } else if (pageIndex >= 462 && pageIndex <= 481) {
        return 'الجزء الرابع والعشرون';
      } else if (pageIndex >= 482 && pageIndex <= 501) {
        return 'الجزء الخامس والعشرون';
      } else if (pageIndex >= 502 && pageIndex <= 521) {
        return 'الجزء السادس والعشرون';
      } else if (pageIndex >= 522 && pageIndex <= 541) {
        return 'الجزء السابع والعشرون';
      } else if (pageIndex >= 542 && pageIndex <= 561) {
        return 'الجزء الثامن والعشرون';
      } else if (pageIndex >= 562 && pageIndex <= 581) {
        return 'الجزء التاسع والعشرون';
      } else if (pageIndex >= 582 && pageIndex <= 604) {
        return 'الجزء الثلاثون';
      } else {
        return 'صفحة غير معروفة';
      }
    }

    return Consumer<providerBrightness>(
      builder: (context, brightness, child) {
        return Text(
          getPartText(index),
          style: TextStyle(
              color: brightness.isDark ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        );
      },
    );
  }
}
