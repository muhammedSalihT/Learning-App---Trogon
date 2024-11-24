import 'dart:convert';

List<SubjectModel> subjectModelFromJson(String str) => List<SubjectModel>.from(
    json.decode(str).map((x) => SubjectModel.fromJson(x)));

class SubjectModel {
  int? id;
  String? title;
  String? description;
  String? image;

  SubjectModel({
    this.id,
    this.title,
    this.description,
    this.image,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
      );
}
