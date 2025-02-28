import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/widgets/drawer_widgets/provider_brightness.dart';
import 'package:iqra_app_new_version_22/widgets/quran%20widgets/directionality_widget.dart';
import 'package:iqra_app_new_version_22/widgets/quran%20widgets/parts_surahs.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart';

class SingleChildScrollViewWidget extends StatelessWidget {
  SingleChildScrollViewWidget(
      {super.key, required this.index, required this.jsonData});

  int index;
  var jsonData;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final textScaleFactor =
        screenWidth / 400; // Adjust 400 as a base screen width
    return Consumer<providerBrightness>(
      builder: (context, brightness, child) {
        return Container(
          color: brightness.isDark ? Colors.black : Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: screenWidth / 3),
                    child: Text(
                      'سُورَةٌ ${jsonData[getPageData(index)[0]['surah'] - 1]["name"]}',
                      style: TextStyle(
                          fontSize: 18 * textScaleFactor,
                          fontWeight: FontWeight.bold,
                          color:
                              brightness.isDark ? Colors.white : Colors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "$index",
                    style: TextStyle(
                      fontSize: 18 * textScaleFactor,
                      fontWeight: FontWeight.bold,
                      color: brightness.isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: screenWidth / 3.8),
                    child: Container(
                      child: Center(
                        child: PartIndicator(index),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: CustomDirectionality(
                    index: index,
                    jsonData: jsonData,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
