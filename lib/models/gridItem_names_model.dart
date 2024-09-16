import 'package:flutter/material.dart';

class GridItem {
  final String name;
  final String imagePath;
  final Widget destinationPage;

  GridItem({
    required this.name,
    required this.imagePath,
    required this.destinationPage,
  });
}
