class SectionDetailModel {
  int? sectionId;
  String? count;
  String? description;
  String? reference;
  String? content;

  SectionDetailModel(this.sectionId, this.count, this.description,
      this.reference, this.content);

  SectionDetailModel.fromJson(Map<String, dynamic> jason) {
    sectionId = jason["section_id"];
    count = jason["count"];
    description = jason["description"];
    reference = jason["reference"];
    content = jason["content"];
  }
}
