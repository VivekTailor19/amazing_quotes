import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotopia/controller/quote_controller.dart';
import 'package:quotopia/screen/add/add_Category_screen.dart';
import 'package:quotopia/screen/add/add_Quote_screen.dart';
import 'package:sizer/sizer.dart';

import '../../utils/quote_db_helper.dart';

class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {


  @override
  void initState() {
    super.initState();
    control.loadCategoryDB();
  }
  TextEditingController tcategory = TextEditingController();

  QuoteController control = Get.put(QuoteController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,

        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(child: Text("Category"),),
                Tab(child: Text("Quote"),),
              ],
            ),
          ),


          body: TabBarView(
            children: [
              Column(
                children: [
                  SizedBox(height: 3.h,),
                  CustomTextField(hint: "Category",controller: tcategory,kboard: TextInputType.text),
                  SizedBox(height: 1.5.h,),
                  GestureDetector(
                    onTap: () {
                      Quote_DB_Helper.quote_db_helper.insertCategory(tcategory.text);
                      control.loadCategoryDB();
                      tcategory.clear();
                    },
                    child: Container(height: 60,width: 150,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Color(0xff0A1172)),
                      alignment: Alignment.center,
                      child: Text("Add Category",style: TextStyle(fontSize: 15.sp,color: Colors.white,fontWeight: FontWeight.w400),),
                    ),
                  ),
                  SizedBox(height: 3.h,),
                  control.categoryList != null
                      ? Expanded(
                    child: Obx(
                          () =>  ListView.builder(
                        itemCount: control.categoryList.length,
                        itemBuilder: (context, index) {

                          return Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 5,vertical: 4),
                            child: GestureDetector(
                              onTap: () {
                                tcategory.text = control.categoryList[index]['category'];

                                Get.defaultDialog(title: "Update Category",content: Column(
                                  children: [
                                    SizedBox(height: 1.5.h,),
                                    CustomTextField(hint: "Category",kboard: TextInputType.text,controller: tcategory),
                                    SizedBox(height: 2.h,),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(onPressed: () async {

                                          Quote_DB_Helper.quote_db_helper.deleteInCategoryTABLE(control.categoryList[index]['ID']);
                                          control.loadCategoryDB();
                                          Get.back();

                                        }, icon: Icon(Icons.delete_outline_rounded),iconSize: 30.sp,color: Colors.red,),


                                        IconButton(onPressed: () async {
                                          await Quote_DB_Helper.quote_db_helper.updateInCategoryTABLE(
                                              id: control.categoryList[index]['ID'],
                                              category: control.categoryList[index]['category']);

                                          control.loadCategoryDB();
                                          Get.back();

                                        }, icon: Icon(Icons.security_update_good_rounded),iconSize: 30.sp,color: Colors.green,)
                                      ],
                                    )
                                  ],
                                ));
                              },
                              child: Container(height: 60,width: 100.w,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.w),color: Colors.indigo.shade400),
                                child: Row(children: [
                                  Text("${index + 1}",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,color: Colors.white),),
                                  SizedBox(width: 15,),
                                  Text("${control.categoryList[index]['category']}",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,color: Colors.white),),
                                ],),

                              ),
                            ),
                          );

                        },),
                    ),
                  )
                      : Container(),



                ],
              ),
              Add_Quote_Screen()
            ],
          ),

        ),
      ),
    );
  }

  Padding CustomTextField({controller,hint,kboard}) {
    return Padding(
      padding:  EdgeInsets.all(10),
      child: TextField(
        style: TextStyle(color: Color(0xff0A1172),fontSize: 16),
        keyboardType: kboard,
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            label: Text("Enter $hint",style: TextStyle(color: Color(0xff0A1172)),),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff0A1172),width: 1.5),borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0x550A1172),width: 1),borderRadius: BorderRadius.circular(10)),
            enabled: true

        ),
      ),
    );
  }

}
