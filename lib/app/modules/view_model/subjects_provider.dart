import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lms_app/app/constents/const_text.dart';
import 'package:lms_app/app/modules/model/subject_model.dart';
import 'package:lms_app/app/modules/resources/subject_resources.dart';
import 'package:lms_app/app/utils/util_enum.dart';
import 'package:lms_app/app/utils/util_methods.dart';

class SubjectsProvider extends ChangeNotifier {
  ApiResponceType subjectResponce = ApiResponceType.loading;
  List<SubjectModel> subjectDataList = [];
  bool firstTap = false;

  void getSubjectsData({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        subjectResponce = ApiResponceType.loading;
        notifyListeners();
      }
      final result = await SubjectResources.getSubjectDataApi();
      subjectResponce = result.type;
      notifyListeners();
      if (subjectResponce == ApiResponceType.data) {
        subjectDataList.clear();
        subjectDataList = subjectModelFromJson(result.data.toString());
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
      subjectResponce = ApiResponceType.internalException;
      notifyListeners();
    }
  }

  List<SubjectModel>? getCurrentData() {
    if (subjectResponce == ApiResponceType.loading) {
      return List.filled(
          10,
          SubjectModel(
            title: 'Unknown',
          ));
    }
    if (subjectResponce == ApiResponceType.data) {
      return subjectDataList;
    }
    return null;
  }

  // for alert the user when the unexpected poping from app
  Future<bool> ctrUserBackScreen() async {
    if (firstTap) {
      SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
      return true;
    } else {
      firstTap = true;

      UtilMethods.getSnackBar(ConstText.exit);
      Timer(
        const Duration(seconds: 2),
        () {
          firstTap = false;
        },
      );
      notifyListeners();
    }
    return false;
  }
}
