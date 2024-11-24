import 'dart:convert';

List<ChapterModel> chapterModelFromJson(String str) => List<ChapterModel>.from(
    json.decode(str).map((x) => ChapterModel.fromJson(x)));

class ChapterModel {
  int? id;
  String? title;
  String? description;

  ChapterModel({
    this.id,
    this.title,
    this.description,
  });

  factory ChapterModel.fromJson(Map<String, dynamic> json) => ChapterModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
      );
}
