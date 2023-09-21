import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:klashalunchapp/view/landing_screen.dart';

import 'view/ingredient_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return
          MaterialApp(
            builder: EasyLoading.init(),
            title: 'Flutter Demo',
            theme: ThemeData(
              pageTransitionsTheme: const PageTransitionsTheme(builders: {
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              }),
              fontFamily: 'Poppins',
              primarySwatch: Colors.purple,
            ),
            home: child,
          );
      },

      child: const LandingPage(),
    );
  }

}

