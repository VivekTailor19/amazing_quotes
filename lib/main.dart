import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotopia/screen/home_Screen.dart';
import 'package:quotopia/screen/splash_Screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/":(p0) => SplashScreen(),
          "/home": (p0) => HomeScreen()

        },
      ),
    ),
  );
}
