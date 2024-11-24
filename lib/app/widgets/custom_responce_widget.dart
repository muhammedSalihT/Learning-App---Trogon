import 'package:flutter/material.dart';
import 'package:lms_app/app/constents/const_assets.dart';
import 'package:lms_app/app/constents/const_colors.dart';
import 'package:lms_app/app/constents/const_text.dart';
import 'package:lms_app/app/utils/util_enum.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ApiResponceWidget extends StatefulWidget {
  const ApiResponceWidget({
    super.key,
    required this.type,
    required this.child,
    required this.reCallFunction,
  });

  final ApiResponceType? type;
  final Widget child;
  final Function() reCallFunction;

  @override
  State<ApiResponceWidget> createState() => _ApiResponceWidgetState();
}

class _ApiResponceWidgetState extends State<ApiResponceWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.type == ApiResponceType.serverException ||
        widget.type == ApiResponceType.internalException) {
      return ExceptionWidget(
        widget: widget,
        title: ConstText.wentWrong,
      );
    } else if (widget.type == ApiResponceType.internetException) {
      return ExceptionWidget(
        widget: widget,
        title: ConstText.noInternet,
      );
    } else {
      return RefreshIndicator(
        color: ConstColors.appPrimeryColor,
        onRefresh: () => widget.reCallFunction(),
        child: SkeletonWidget(
            enabled: widget.type == ApiResponceType.loading,
            child: widget.child),
      );
    }
  }
}

class ExceptionWidget extends StatelessWidget {
  const ExceptionWidget({
    super.key,
    required this.widget,
    this.title,
  });

  final ApiResponceWidget widget;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title ??
              'Somthing went wrong,Check your network connection and try again'),
          Lottie.asset(
              ConstAssets.imagesBaseString + ConstAssets.exceptionImage,
              height: 150,
              width: 150),
          TextButton(
            child: const Text(
              'Try again',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () => widget.reCallFunction(),
          )
        ],
      ),
    );
  }
}

class SkeletonWidget extends StatelessWidget {
  const SkeletonWidget({super.key, required this.child, required this.enabled});

  final Widget child;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(baseColor: Colors.grey[300]!),
      textBoneBorderRadius: TextBoneBorderRadius(BorderRadius.circular(5)),
      enabled: enabled,
      child: child,
    );
  }
}
