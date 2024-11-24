import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_app/app/constents/const_colors.dart';
import 'package:lms_app/app/widgets/custom_text_widget.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({
    super.key,
    required this.title,
    this.isShowBack = false,
  });

  final String title;
  final bool isShowBack;

  @override
  Size get preferredSize => Size.fromHeight(50.h);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isShowBack
          ? IconButton(
              color: ConstColors.appWhite,
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_rounded),
            )
          : const SizedBox(),
      centerTitle: true,
      title: CustomTextWidget(
        text: title,
        fontSize: 20,
        maxLines: 1,
        color: ConstColors.appWhite,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
