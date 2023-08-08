import 'package:amazing_quotes/controller/quote_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  QuoteController control = Get.put(QuoteController());

  Future<void> gotDataDb()
  async {
    await control.loadCategoryDB();
    if(control.categoryList.isEmpty)
    {
      control.uploadDefaultDataInDatabase();
      await control.loadCategoryDB();
    }

  }
  @override
  void initState() {
    super.initState();
    gotDataDb();
  }
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 4),() => Get.offAllNamed("/home"),);

    return SafeArea(
      child: Scaffold(
        body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/logo.png",height:30.h,),
            CircularProgressIndicator(color: Color(0xff015B8A),)
          ],
        )),
      ),
    );
  }
}
