import 'package:amazing_quotes/screen/view_fliterQuote_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

import 'screen/add/add_Screen.dart';
import 'screen/home_Screen.dart';
import 'screen/splash_Screen.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/":(p0) => SplashScreen(),
          "/home": (p0) => HomeScreen(),
          "/add":(p0) => Add_Screen(),
           "/viewCategory":(p0) => View_FilteredQuote_Screen(),
        },
      ),
    ),
  );
}
