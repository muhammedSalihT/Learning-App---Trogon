import 'package:flutter/material.dart';

class UtilNavigation {
  static push(BuildContext context, page) {
    Navigator.push(context, _createRoute(page));
  }

  static pushAndReplace(BuildContext context, page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => page,
      ),
    );
  }

  static pushAndRemoveUntil(BuildContext context, page) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => page,
      ),
      (_) => false,
    );
  }

  pushNamedAndRemoveUntil(BuildContext context, page) {
    Navigator.pushNamedAndRemoveUntil(context, page, (route) => false);
  }

  static Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
