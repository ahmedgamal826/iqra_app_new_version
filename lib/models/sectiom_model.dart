class AzkarModel {
  int? id;
  String? name;
  String? icon;
  String? color;

  AzkarModel(this.id, this.name, this.icon, this.color);

  AzkarModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    icon = json["icon"];
    color = json["color"];
  }
}

List<int> numberOfAzkars = [1, 2, 3, 4, 5];
