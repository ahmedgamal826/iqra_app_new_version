import 'package:flutter/material.dart';

class AhadesModel {
  int? id;
  String? name;
  String? icon;
  Color? color;

  AhadesModel(this.id, this.name, this.icon, this.color);

  AhadesModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    icon = json["icon"];
    color = json["color"];
  }
}
