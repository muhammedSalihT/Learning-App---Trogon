import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_app/app/constents/const_assets.dart';
import 'package:lms_app/app/constents/const_colors.dart';
import 'package:lms_app/app/modules/model/chapter_model.dart';
import 'package:lms_app/app/modules/view/vedioplayer_view.dart';
import 'package:lms_app/app/modules/view_model/vedio_list_provider.dart';
import 'package:lms_app/app/utils/util_navigation.dart';
import 'package:lms_app/app/widgets/custom_appbar.dart';
import 'package:lms_app/app/widgets/custom_responce_widget.dart';
import 'package:lms_app/app/widgets/custom_svg_widget.dart';
import 'package:lms_app/app/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

class VedioListView extends StatefulWidget {
  const VedioListView({super.key, required this.currentChapterData});

  final ChapterModel currentChapterData;

  @override
  State<VedioListView> createState() => _VedioListViewState();
}

class _VedioListViewState extends State<VedioListView> {
  @override
  void initState() {
    final vedioListPro = Provider.of<VedioListProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => vedioListPro.getVedioData(
          isRefresh: true, chapterId: widget.currentChapterData.id!),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: widget.currentChapterData.title ?? '',
        isShowBack: true,
      ),
      body: Consumer<VedioListProvider>(builder: (context, vedioListPro, _) {
        final vedioDataList = vedioListPro.getCurrentData();
        return ApiResponceWidget(
          reCallFunction: () => vedioListPro.getVedioData(
              isRefresh: true, chapterId: widget.currentChapterData.id!),
          type: vedioListPro.vedioListResponce,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 20),
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10.h,
                );
              },
              itemCount: 10,
              itemBuilder: (context, index) {
                final data = vedioDataList?[index];
                return InkWell(
                    onTap: () {
                      UtilNavigation.push(
                          context,
                          VedioplayerView(
                            currentVedioData: data!,
                          ));
                    },
                    child: Card(
                      elevation: 2,
                      shadowColor: Colors.black54,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0.h, horizontal: 15.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomSvgWidget(
                                size: 40,
                                path: ConstAssets.iconsBaseString +
                                    ConstAssets.vedioIcon),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 180.h,
                                    child: CustomTextWidget(
                                      text: data?.title ?? '',
                                      fontSize: 15,
                                      maxLines: 4,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 20.sp,
                              color: ConstColors.appPrimeryColor,
                            ),
                          ],
                        ),
                      ),
                    ));
              },
            ),
          ),
        );
      }),
    );
  }
}
