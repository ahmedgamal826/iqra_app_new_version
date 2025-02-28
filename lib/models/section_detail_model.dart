class SectionDetailModel {
  int? sectionId;
  String? count;
  String? description;
  String? reference;
  String? content;
  final String originalCount;

  SectionDetailModel(this.sectionId, this.count, this.description,
      this.reference, this.content)
      : originalCount = count ?? "0";

  // SectionDetailModel.fromJson(Map<String, dynamic> jason) {
  //   sectionId = jason["section_id"];
  //   count = jason["count"];
  //   description = jason["description"];
  //   reference = jason["reference"];
  //   content = jason["content"];
  // }

  SectionDetailModel.fromJson(Map<String, dynamic> json)
      : sectionId = json["section_id"],
        count = json["count"],
        description = json["description"],
        reference = json["reference"],
        content = json["content"],
        originalCount =
            json["count"] ?? "0"; // تخزين العدد الأصلي عند التحميل من JSON
}
