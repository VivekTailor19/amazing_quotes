import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotopia/model/quote_model.dart';
import 'package:quotopia/utils/quote_db_helper.dart';
import 'package:sizer/sizer.dart';

import '../../controller/quote_controller.dart';

class Add_Quote_Screen extends StatefulWidget {
  const Add_Quote_Screen({super.key});

  @override
  State<Add_Quote_Screen> createState() => _Add_Quote_ScreenState();
}

class _Add_Quote_ScreenState extends State<Add_Quote_Screen> {

  TextEditingController tquote = TextEditingController();
  TextEditingController tcategory = TextEditingController();
  TextEditingController tauthor = TextEditingController();

  QuoteController control = Get.put(QuoteController());




  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 3.h,),

          CustomTextField(hint: "Quote",controller: tquote,kboard: TextInputType.text),
          CustomTextField(hint: "Category",controller: tcategory,kboard: TextInputType.text),
          CustomTextField(hint: "Author",controller: tauthor,kboard: TextInputType.text),
          CustomTextField(hint: "Favorite",controller: tauthor,kboard: TextInputType.text),

          GestureDetector(
            onTap: () {
              QuoteModel model = QuoteModel(
                quote: tquote.text,
                category: tcategory.text,
                author: tauthor.text,
                fav: 'No'
              );
              Quote_DB_Helper.quote_db_helper.insertQuote(model);
              control.loadCategoryDB();
              tquote.clear();
              tcategory.clear();
              tauthor.clear();
              print("quote list length ==>> ${control.quoteList.length}");
            },
            child: Container(height: 60,width: 150,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Color(0xff0A1172)),
              alignment: Alignment.center,
              child: Text("Add Quote",style: TextStyle(fontSize: 15.sp,color: Colors.white,fontWeight: FontWeight.w400),),
            ),
          ),
          SizedBox(height: 3.h,),



        ],
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
