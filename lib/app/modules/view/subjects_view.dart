import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_app/app/constents/const_colors.dart';
import 'package:lms_app/app/modules/view/chapters_view.dart';
import 'package:lms_app/app/modules/view_model/subjects_provider.dart';
import 'package:lms_app/app/utils/util_methods.dart';
import 'package:lms_app/app/utils/util_navigation.dart';
import 'package:lms_app/app/widgets/custom_appbar.dart';
import 'package:lms_app/app/widgets/custom_responce_widget.dart';
import 'package:lms_app/app/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

class SubjectsView extends StatefulWidget {
  const SubjectsView({super.key});

  @override
  State<SubjectsView> createState() => _SubjectsViewState();
}

class _SubjectsViewState extends State<SubjectsView> {
  @override
  void initState() {
    final subjectPro = Provider.of<SubjectsProvider>(context, listen: false);
    subjectPro.getSubjectsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: "Subjects",
      ),
      body: Consumer<SubjectsProvider>(builder: (context, subPro, _) {
        final subjectDataList = subPro.getCurrentData();
        return PopScope(
          canPop: false,
          onPopInvoked: (
            didPop,
          ) =>
              subPro.ctrUserBackScreen(),
          child: ApiResponceWidget(
            reCallFunction: () => subPro.getSubjectsData(isRefresh: true),
            type: subPro.subjectResponce,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: subjectDataList?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: .9,
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  final subjectData = subjectDataList?[index];
                  return InkWell(
                    onTap: () => UtilNavigation.push(
                        context,
                        ChaptersView(
                          currentSubjectData: subjectData!,
                        )),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: ConstColors.greyLight),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: UtilMethods.showNetWorkImage(
                                height: 55.h, image: subjectData?.image ?? ''),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: CustomTextWidget(
                              fontSize: 12,
                              text: subjectData?.title ?? '',
                              fontWeight: FontWeight.bold,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
