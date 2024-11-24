import 'dart:convert';

List<VedioDataModel> vedioDataModelFromJson(String str) =>
    List<VedioDataModel>.from(
        json.decode(str).map((x) => VedioDataModel.fromJson(x)));

class VedioDataModel {
  int? id;
  String? title;
  String? description;
  String? videoType;
  String? videoUrl;

  VedioDataModel({
    this.id,
    this.title,
    this.description,
    this.videoType,
    this.videoUrl,
  });

  factory VedioDataModel.fromJson(Map<String, dynamic> json) => VedioDataModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        videoType: json["video_type"],
        videoUrl: json["video_url"],
      );
}
