import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_app/app/constents/const_colors.dart';
import 'package:lms_app/app/modules/model/subject_model.dart';
import 'package:lms_app/app/modules/view/vedio_list_view.dart';
import 'package:lms_app/app/modules/view_model/chapters_provider.dart';
import 'package:lms_app/app/utils/util_methods.dart';
import 'package:lms_app/app/utils/util_navigation.dart';
import 'package:lms_app/app/widgets/custom_appbar.dart';
import 'package:lms_app/app/widgets/custom_responce_widget.dart';
import 'package:lms_app/app/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

class ChaptersView extends StatefulWidget {
  const ChaptersView({super.key, required this.currentSubjectData});

  final SubjectModel currentSubjectData;

  @override
  State<ChaptersView> createState() => _ChaptersViewState();
}

class _ChaptersViewState extends State<ChaptersView> {
  @override
  void initState() {
    final chapterPro = Provider.of<ChaptersProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => chapterPro.getChaptersData(
          isRefresh: true, subjectId: widget.currentSubjectData.id!),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: widget.currentSubjectData.title ?? '',
        isShowBack: true,
      ),
      body: Consumer<ChaptersProvider>(builder: (context, chaptPro, _) {
        final subjectDataList = chaptPro.getCurrentData();
        return ApiResponceWidget(
          reCallFunction: () => chaptPro.getChaptersData(
              isRefresh: true, subjectId: widget.currentSubjectData.id!),
          type: chaptPro.chaptersResponce,
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
                final data = subjectDataList?[index];
                return InkWell(
                    onTap: () {
                      UtilNavigation.push(
                          context,
                          VedioListView(
                            currentChapterData: data!,
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
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: UtilMethods.showNetWorkImage(
                                  height: 55.h,
                                  image: widget.currentSubjectData.image ?? ''),
                            ),
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
                            Expanded(
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 20.sp,
                                color: ConstColors.appPrimeryColor,
                              ),
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
