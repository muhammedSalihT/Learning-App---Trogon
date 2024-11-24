import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lms_app/app/modules/model/chapter_model.dart';
import 'package:lms_app/app/modules/resources/chapter_resources.dart';
import 'package:lms_app/app/utils/util_enum.dart';

class ChaptersProvider extends ChangeNotifier {
  ApiResponceType chaptersResponce = ApiResponceType.loading;
  List<ChapterModel> chapterDataList = [];

  void getChaptersData({bool isRefresh = false, required int subjectId}) async {
    try {
      if (isRefresh) {
        chaptersResponce = ApiResponceType.loading;
        notifyListeners();
      }
      final result = await ChapterResources.getChapterDataApi(subId: subjectId);
      chaptersResponce = result.type;
      notifyListeners();
      if (chaptersResponce == ApiResponceType.data) {
        chapterDataList.clear();
        chapterDataList = chapterModelFromJson(result.data.toString());
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
      chaptersResponce = ApiResponceType.internalException;
      notifyListeners();
    }
  }

  List<ChapterModel>? getCurrentData() {
    if (chaptersResponce == ApiResponceType.loading) {
      return List.filled(
          10, ChapterModel(title: 'Unknown', description: 'Unknown'));
    }
    if (chaptersResponce == ApiResponceType.data) {
      return chapterDataList;
    }
    return null;
  }
}
