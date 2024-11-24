import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lms_app/app/constents/const_assets.dart';
import 'package:lms_app/app/constents/const_colors.dart';
import 'package:lms_app/app/modules/view_model/splash_provider.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final splashPro = Provider.of<SplashProvider>(context, listen: false);
    splashPro.controlSplashNav(context);
    return Scaffold(
      backgroundColor: ConstColors.appPrimeryColor,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: ConstColors.appSplashGrad),
        ),
        child: Center(
            child: Image.asset(
          ConstAssets.imagesBaseString + ConstAssets.splashLogo,
          height: 200.h,
          width: 200.h,
        )),
      ),
    );
  }
}
