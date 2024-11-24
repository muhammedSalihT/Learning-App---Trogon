import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_app/app/constents/const_colors.dart';
import 'package:lms_app/app/modules/model/vedio_data_model.dart';
import 'package:lms_app/app/modules/view_model/vedioplayer_provider.dart';
import 'package:lms_app/app/widgets/custom_appbar.dart';
import 'package:lms_app/app/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

class VedioplayerView extends StatefulWidget {
  const VedioplayerView({super.key, required this.currentVedioData});

  final VedioDataModel currentVedioData;

  @override
  State<VedioplayerView> createState() => _VedioplayerViewState();
}

class _VedioplayerViewState extends State<VedioplayerView> {
  @override
  Widget build(BuildContext context) {
    final vedioPlayerPro = Provider.of<VedioplayerProvider>(context);
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: widget.currentVedioData.title ?? '',
        isShowBack: true,
      ),
      body: ColoredBox(
        color: ConstColors.greyLight,
        child: Column(
          children: [
            SizedBox(
              height: 200.h,
              child: vedioPlayerPro.getPlayer(widget.currentVedioData, context),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: CustomTextWidget(
                text: widget.currentVedioData.description ?? '',
                maxLines: 4,
                fontSize: 13.sp,
                color: ConstColors.appPrimeryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
