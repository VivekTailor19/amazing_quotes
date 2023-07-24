import 'dart:math';

import 'package:amazing_quotes/controller/quote_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class View_Category_Screen extends StatefulWidget {
  const View_Category_Screen({super.key});

  @override
  State<View_Category_Screen> createState() => _View_Category_ScreenState();
}

class _View_Category_ScreenState extends State<View_Category_Screen> {


  int tempImgIndex = 3;
  String title = "";
  String subdata = "";
  String what  = "";
  Map mapDATA = {};
  QuoteController control = Get.put(QuoteController());
  @override
  void initState() {
    super.initState();
    mapDATA = Get.arguments;
    what  = mapDATA['what'];
    if(what  == "category")
      {
        subdata = "category";
      }
    else
      {
        subdata = "author";
      }
    title = mapDATA["value"];
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(

      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Color(0xff015B8A),
          elevation: 0,
          centerTitle: true,
            title: Text("$title",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600),)
        ),

        body: ListView.builder(
           padding: EdgeInsets.only(left:3.w,right:3.w,top: 5.w),
          itemCount: control.filterData.length,
          itemBuilder: (context, index) {

             Random r = Random();
             control.imgIndex.value = r.nextInt(control.bgImgList.length);

             return QuoteListTile(
              quote: control.filterData[index]['quote'],
              author: what == "category" ? control.filterData[index]['author'] :control.filterData[index]['category'] ,
               img: control.bgImgList[control.imgIndex.value]
          );
        },)

      ),
    );
  }

 Widget QuoteListTile({quote,author,img})
 {
   return Container(
     margin: EdgeInsets.only(bottom:3.w),
     height: 25.h,
     width: 100.w,
     decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w),
       image: DecorationImage(image: AssetImage("$img"),fit: BoxFit.cover),

       border: Border.all(color: Colors.black12)
     ),
     child: Column(
       children: [
         SizedBox(height: 3.h,),
         Text("$quote",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13.sp,color: Colors.white),maxLines: 5,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),
         Spacer(),
         Row(mainAxisAlignment: MainAxisAlignment.end,
           children: [
             Text("- $author",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15.sp,color: Colors.white),textAlign: TextAlign.center,),
             SizedBox(width: 5.w,),
           ],
         ),
         SizedBox(height: 1.5.h,),

         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
           mainAxisSize: MainAxisSize.min,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             IconButton(icon: Icon(Icons.done_all_outlined,color: Colors.white),onPressed: () {

             },),
             IconButton(icon: Icon(Icons.copy_outlined,color: Colors.white),
               onPressed: () {

               if(control.imgIndex.value < control.bgImgList.length - 1)
                 {
                   tempImgIndex = control.imgIndex.value++;
                 }
               else
                 {
                   control.imgIndex.value = 0;
                 }
               print("img Index ==========${control.imgIndex.value}");
             },),
             IconButton(icon: Icon(Icons.favorite_outline_rounded,color: Colors.white),onPressed: () {

             },),
           ],
         ),
         SizedBox(height: 1.h,)
       ],
     ),
   );
 }

}
