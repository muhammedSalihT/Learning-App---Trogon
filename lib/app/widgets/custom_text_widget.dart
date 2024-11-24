import 'package:flutter/material.dart';
import 'package:lms_app/app/constents/const_colors.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final TextAlign textAlign;
  final int maxLines;
  final FontWeight? fontWeight;

  const CustomTextWidget(
      {super.key,
      required this.text,
      this.fontSize = 26,
      this.color,
      this.textAlign = TextAlign.center,
      this.maxLines = 2,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? ConstColors.appBlack,
      ),
    );
  }
}
