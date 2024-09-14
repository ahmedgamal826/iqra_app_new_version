import 'package:flutter/material.dart';

class StoriesModel {
  int? id;
  String? name;
  String? icon;
  Color? color;

  StoriesModel(this.id, this.name, this.icon, this.color);

  StoriesModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    icon = json["icon"];
    color = json["color"];
  }
}
