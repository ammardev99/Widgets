import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:widgets/modules/auth/login/view.dart';
import 'package:widgets/routes/routes.dart';
import 'package:widgets/utilities/color.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
    statusBarColor: AppColors.splashColor,
    statusBarBrightness: Brightness.light,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widgets App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.splashColor),
        useMaterial3: true,
      ),
      getPages: AppRoutes.appRoutes(),
      home: AnimatedSplashScreen(
          duration: 2000,
          splashTransition: SplashTransition.fadeTransition,
          centered: true,
          splash: SvgPicture.asset(
            'assets/svg/app_logo.svg',
            semanticsLabel: 'Widgets',
            height: 100,
          ),
          nextScreen: LoginPage()),
    );
  }
}
