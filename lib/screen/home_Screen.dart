import 'package:amazing_quotes/controller/quote_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    control.loadCategoryDB();
  }

  QuoteController control = Get.put(QuoteController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text("Quotes"),
          centerTitle: true,

          leading: IconButton(icon: Icon(Icons.refresh_rounded), iconSize: 25,
            onPressed: () async {
              // control.convertDATA();
              // control.quoteList.map((e) async => await Quote_DB_Helper.quote_db_helper.insertInDB(
              //     QuoteModel(category: e.category,quote: e.quote,fav: e.fav))).toList();

            },),

          actions: [
            IconButton(onPressed: () {
              Get.toNamed("/add");
            }, icon: Icon(Icons.add_outlined))
          ],
        ),

        body: Padding(
          padding: EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: CarouselSlider(
                        items: control.imgList
                            .map((e) =>
                            Container(
                              height: 25.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.w),
                                  color: Colors.amber,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "$e"),
                                      fit: BoxFit.fill)),
                            ))
                            .toList(),
                        options: CarouselOptions(

                          autoPlay: true,
                          scrollDirection: Axis.horizontal,
                          viewportFraction: 1,
                          height: 25.h,
                          initialPage: control.currentSliderIndex.value,
                          onPageChanged: (index, reason) {
                            control.currentSliderIndex.value = index;
                          },
                        ),
                      ),
                    ),


                  ],
                ),

                Container(height: 25.h, width: 100.w, color: Colors.white,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      TitleTab("Most Popular"),

                    ],
                  ),
                ),

                SizedBox(height: 5,),
                Container(height: 25.h, width: 100.w, color: Colors.white,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      TitleTab("Quotes by Category"),
                      Expanded(
                        child: Obx(
                              () =>
                              GridView.builder(

                                itemCount: control.categoryList.length,
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.all(2.5),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 46.w,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 5
                                ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(onTap: () {

                                    Get.toNamed("/viewCategory",arguments: control.categoryList[index]['category'] );
                                  },
                                  child: SubTitleBox(control.categoryList[index]['category']));

                                },),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 5,),
                Container(height: 25.h, width: 100.w, color: Colors.white,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      TitleTab("Quotes by Author"),

                    ],
                  ),
                ),

                SizedBox(height: 5,),


              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget TitleTab(String title) =>
      Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Text("$title",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17.sp),),
      );

  Widget SubTitleBox(String subtitle) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.5),
      height: 9.h,
      width: 45.w,
      alignment: Alignment.center,
      child: Text("$subtitle", style: TextStyle(
          fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.white),),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.w), color: Colors.redAccent),
    );
  }
}
