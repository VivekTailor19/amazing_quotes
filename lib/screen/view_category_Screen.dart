import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class View_Category_Screen extends StatefulWidget {
  const View_Category_Screen({super.key});

  @override
  State<View_Category_Screen> createState() => _View_Category_ScreenState();
}

class _View_Category_ScreenState extends State<View_Category_Screen> {

  String title = "";
  @override
  void initState() {
    super.initState();
    title = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
            title: Text("$title",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600),)
        ),

        body: ListView.builder(
           padding: EdgeInsets.only(left:3.w,right:3.w,top: 5.w),
          itemCount: 4,
          itemBuilder: (context, index) {
          return QuoteListTile();
        },)

      ),
    );
  }

 Widget QuoteListTile({quote,author})
 {
   return Container(
     margin: EdgeInsets.only(bottom:3.w),
     height: 25.h,
     width: 100.w,
     decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.w),
       border: Border.all(color: Colors.black12)
     ),
     child: Column(
       children: [
         SizedBox(height: 1.h,),
         Text("sdfsdf\nsfdsd]f\msdf\nsfs\nf",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15.sp),maxLines: 5,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),
         Spacer(),

         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
           mainAxisSize: MainAxisSize.min,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             IconButton(icon: Icon(Icons.done_all_outlined),onPressed: () {

             },),
             IconButton(icon: Icon(Icons.copy_outlined),onPressed: () {

             },),
             IconButton(icon: Icon(Icons.favorite_outline_rounded),onPressed: () {

             },),
           ],
         ),
         SizedBox(height: 2.h,)
       ],
     ),
   );
 }

}
