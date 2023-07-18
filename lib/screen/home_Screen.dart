
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotopia/controller/quote_controller.dart';
import 'package:quotopia/model/quote_model.dart';
import 'package:quotopia/utils/quote_db_helper.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  QuoteController control = Get.put(QuoteController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text("Quotes"),
          centerTitle: true,

          leading: IconButton(icon: Icon(Icons.refresh_rounded),iconSize: 25,
            onPressed: () async {

              // control.convertDATA();
            // control.quoteList.map((e) async => await Quote_DB_Helper.quote_db_helper.insertInDB(
            //     QuoteModel(category: e.category,quote: e.quote,fav: e.fav))).toList();

          },),

          actions: [
            IconButton(onPressed: () {
              Get.toNamed("/add");
            }, icon: Icon(Icons.add_card_rounded))
          ],
        ),

        body: Padding(
          padding:  EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Container(height: 25.h,width: 100.w,color: Colors.amber.shade300,),
                ),

                Container(height: 25.h,width:100.w,color: Colors.white,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,

                    children: [
                      TitleTab("Most Popular"),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SubTitleBox("Life"),
                          SubTitleBox("Motivational"),
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SubTitleBox("Life"),
                          SubTitleBox("Motivational"),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 5,),
                Container(height: 25.h,width:100.w,color: Colors.white,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,

                    children: [
                      TitleTab("Quotes by Category"),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SubTitleBox("Passion"),
                          SubTitleBox("Believe"),
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SubTitleBox("Positivity"),
                          SubTitleBox("Success"),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 5,),
                Container(height: 25.h,width:100.w,color: Colors.white,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,

                    children: [
                      TitleTab("Quotes by Author"),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SubTitleBox("Life"),
                          SubTitleBox("Motivational"),
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SubTitleBox("Life"),
                          SubTitleBox("Motivational"),
                        ],
                      ),
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

  Widget TitleTab(String title) => Padding(
    padding:  EdgeInsets.symmetric(vertical: 5),
    child: Text("$title",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17.sp),),
  );

  Widget SubTitleBox(String subtitle)
  {
    return Container(margin: EdgeInsets.symmetric(vertical: 2.5),
      height: 9.h,width: 45.w,alignment: Alignment.center,child: Text("$subtitle",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500,color: Colors.white),),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.w),color: Colors.redAccent),
    );
  }
}
