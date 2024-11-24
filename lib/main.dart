import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_app/app/constents/const_colors.dart';
import 'package:lms_app/app/modules/view/splash_view.dart';
import 'package:lms_app/app/modules/view_model/chapters_provider.dart';
import 'package:lms_app/app/modules/view_model/splash_provider.dart';
import 'package:lms_app/app/modules/view_model/subjects_provider.dart';
import 'package:lms_app/app/modules/view_model/vedio_list_provider.dart';
import 'package:lms_app/app/modules/view_model/vedioplayer_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SplashProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SubjectsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChaptersProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => VedioListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => VedioplayerProvider(),
        ),
      ],
      child: ScreenUtilInit(
        child: MaterialApp(
          builder: BotToastInit(),
          debugShowCheckedModeBanner: false,
          title: 'LMS App',
          theme: ThemeData(
            appBarTheme:
                const AppBarTheme(backgroundColor: ConstColors.appPrimeryColor),
            colorScheme:
                ColorScheme.fromSeed(seedColor: ConstColors.appPrimeryColor),
            useMaterial3: true,
          ),
          home: const SplashView(),
        ),
      ),
    );
  }
}
