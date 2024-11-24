import 'package:flutter/material.dart';
import 'package:lms_app/app/modules/view/subjects_view.dart';
import 'package:lms_app/app/utils/util_navigation.dart';

class SplashProvider extends ChangeNotifier {
  void controlSplashNav(context) {
    Future.delayed(
      const Duration(milliseconds: 2000),
      () => UtilNavigation.pushAndRemoveUntil(context, const SubjectsView()),
    );
  }
}
