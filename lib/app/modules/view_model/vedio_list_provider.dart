import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lms_app/app/modules/model/vedio_data_model.dart';
import 'package:lms_app/app/modules/resources/vedioplayer_resources.dart';
import 'package:lms_app/app/utils/util_enum.dart';

class VedioListProvider extends ChangeNotifier {
  ApiResponceType vedioListResponce = ApiResponceType.loading;
  List<VedioDataModel> vedioDataList = [];

  void getVedioData({bool isRefresh = false, required int chapterId}) async {
    try {
      if (isRefresh) {
        vedioListResponce = ApiResponceType.loading;
        notifyListeners();
      }
      final result =
          await VedioplayerResources.getVedioDataApi(chaptId: chapterId);
      vedioListResponce = result.type;
      notifyListeners();
      if (vedioListResponce == ApiResponceType.data) {
        vedioDataList.clear();
        vedioDataList = vedioDataModelFromJson(result.data.toString());
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
      vedioListResponce = ApiResponceType.internalException;
      notifyListeners();
    }
  }

  List<VedioDataModel>? getCurrentData() {
    if (vedioListResponce == ApiResponceType.loading) {
      return List.filled(
          10, VedioDataModel(title: 'Unknown', description: 'Unknown'));
    }
    if (vedioListResponce == ApiResponceType.data) {
      return vedioDataList;
    }
    return null;
  }
}
