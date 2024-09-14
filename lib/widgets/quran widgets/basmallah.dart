import 'package:flutter/material.dart';
import 'package:iqra_app_new_version_22/widgets/drawer_widgets/provider_brightness.dart';
import 'package:provider/provider.dart';

class Basmallah extends StatefulWidget {
  int index;
  Basmallah({super.key, required this.index});

  @override
  State<Basmallah> createState() => _BasmallahState();
}

class _BasmallahState extends State<Basmallah> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Consumer<providerBrightness>(
      builder: (context, brightness, child) {
        return Image.asset(
          brightness.isDark
              ? "assets/images/basmala_dark55.png"
              : "assets/images/Basmala.png",
          //color: Colors.black,
          fit: BoxFit.contain,
          width: screenSize.width,
        );
      },
    );
  }
}
