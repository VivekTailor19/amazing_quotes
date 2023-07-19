import 'package:get/get.dart';
import 'package:quotopia/model/quote_model.dart';
import 'package:quotopia/utils/quote_db_helper.dart';


class QuoteController extends GetxController
{
 RxList categoryList = [].obs;
 RxList quoteList = [].obs;
 Future<void> loadCategoryDB()
 async {
  categoryList.value = await Quote_DB_Helper.quote_db_helper.readCategoryTABLE();
  quoteList.value = await Quote_DB_Helper.quote_db_helper.readQuoteTABLE();
  print("quote list length ==>> ${quoteList.length}");
 }

 RxString selCategory = "hii".obs;
 RxList categories = [].obs;

 void onlyReloadCategories()
 {
  String temp = "";
  List list = [];
  for(int i = 0; i < categoryList.length  ; i++)
   {
     temp = categoryList[i]['category'] ;
     list.add(temp);
   }
  categories.value = list;
  print("categories   ===>>>>>>>>>>>>>>> ${categories.length}");
 }

  

}








/*

book ==>  Shreemad bhagwad geeta.
Categories ==>>     success, passion, business, self_development, life, believe
Author    ==>>      Swami Vivekanand, Abdul Kalam, Sardar Patel, Chanakya,

*/

























/*

  List<QuoteModel> quoteList = [
 QuoteModel(category: 'Success',author: 'Jack In',quote: 'Believe and act as if it were impossible to fail.',fav: "No"),
 QuoteModel(category: 'Positivity',author: 'Mehmet D',quote: 'What you do speaks so loudly that I cannot hear what you say.',fav: "No"),
 QuoteModel(category: 'Believe',author: 'V Lukas',quote: 'Love For All, Hatred For None.',fav: "No"),
 QuoteModel(category: 'Motivational',author: 'Jan Noah',quote: 'Change the world by being yourself.',fav: "No"),
 QuoteModel(category: 'Passion',author: 'Mangus',quote: 'Every moment is a fresh beginning.',fav: "No"),
 QuoteModel(category: 'Life',author: 'Rasmus L',quote: 'Never regret anything that made you smile.',fav: "No"),
 QuoteModel(category: 'Powerful',author: 'A Michael',quote: 'Die with memories, not dreams.',fav: "No"),
 QuoteModel(category: 'Success',author: 'David W',quote: 'Aspire to inspire before we expire.',fav: "No"),
 QuoteModel(category: 'Positivity',author: 'Lev Arda',quote: 'Everything you can imagine is real.',fav: "No"),
 QuoteModel(category: 'Believe',author: 'Ethan Os',quote: 'Simplicity is the ultimate sophistication.',fav: "No"),
 QuoteModel(category: 'Motivational',author: 'Li Gabriel',quote: 'Whatever you do, do it well.',fav: "No"),
 QuoteModel(category: 'Passion',author: 'Jack In',quote: 'What we think, we become.',fav: "No"),
 QuoteModel(category: 'Life',author: 'Mehmet D',quote: 'All limitations are self-imposed.',fav: "No"),
 QuoteModel(category: 'Powerful',author: 'V Lukas',quote: 'Tough times never last but tough people do.',fav: "No"),
 QuoteModel(category: 'Success',author: 'Jan Noah',quote: 'Problems are not stop signs, they are guidelines.',fav: "No"),
 QuoteModel(category: 'Positivity',author: 'Mangus',quote: 'Have enough courage to start and enough heart to finish.',fav: "No"),
 QuoteModel(category: 'Believe',author: 'Rasmus L',quote: 'Hate comes from intimidation, love comes from appreciation.Walk away from anything or anyone who takes away from your joy. Life is too short to put up with fools',fav: "No"),
 QuoteModel(category: 'Motivational',author: 'A Michael',quote: 'Life is short, live it. Love is rare, grab it. Anger is bad, dump it. Fear is awful, face it. Memories are sweet, cherish them',fav: "No"),
 QuoteModel(category: 'Passion',author: 'David W',quote: 'If you cannot do great things, do small things in a great way.',fav: "No"),
 QuoteModel(category: 'Life',author: 'Lev Arda',quote: 'What lies behind us and what lies before us are tiny matters compared to what lies within us.',fav: "No"),
 QuoteModel(category: 'Powerful',author: 'Ethan Os',quote: 'It is never too late to be what you might have been.',fav: "No"),
 QuoteModel(category: 'Success',author: 'Li Gabriel',quote: 'Never let your memories be greater than your dreams.',fav: "No"),
 QuoteModel(category: 'Positivity',author: 'Jack In',quote: 'It\'s not whether you get knocked down, it\'s whether you get up.',fav: "No"),
 QuoteModel(category: 'Believe',author: 'Mehmet D',quote: 'The creation of a thousand forests is in one acorn.',fav: "No"),
 QuoteModel(category: 'Motivational',author: 'V Lukas',quote: 'Just keep going. Everybody gets better if they keep at it.',fav: "No"),
 QuoteModel(category: 'Passion',author: 'Jan Noah',quote: 'The best way to predict the future is to invent it.',fav: "No"),
 QuoteModel(category: 'Life',author: 'Mangus',quote: 'Very often a change of self is needed more than a change of scene.',fav: "No"),
 QuoteModel(category: 'Powerful',author: 'Rasmus L',quote: 'Good things come to those who wait... greater things come to those who get off their ass and do anything to make it happen.',fav: "No"),
 QuoteModel(category: 'Success',author: 'A Michael',quote: 'Obsessed is just a word the lazy use to describe the dedicated.',fav: "No"),
 QuoteModel(category: 'Positivity',author: 'David W',quote: 'Even if you fall on your face, you\'re still moving forward.',fav: "No"),
 QuoteModel(category: 'Believe',author: 'Lev Arda',quote: 'I cannot give you the formula for success, but I can give you the formula for failure--which is: Try to please everybody.',fav: "No"),
 QuoteModel(category: 'Motivational',author: 'Ethan Os',quote: 'To avoid criticism, do nothing, say nothing, be nothing.',fav: "No"),
 QuoteModel(category: 'Passion',author: 'Li Gabriel',quote: 'What we fear doing most is usually what we most need to do.',fav: "No"),
 QuoteModel(category: 'Life',author: 'Jack In',quote: 'Believe you can and you\'re halfway there.',fav: "No"),
 QuoteModel(category: 'Powerful',author: 'Mehmet D',quote: 'Believe and act as if it were impossible to fail.',fav: "No"),
 QuoteModel(category: 'Success',author: 'V Lukas',quote: 'What you do speaks so loudly that I cannot hear what you say.',fav: "No"),
 QuoteModel(category: 'Positivity',author: 'Jan Noah',quote: 'Love For All, Hatred For None.',fav: "No"),
 QuoteModel(category: 'Believe',author: 'Mangus',quote: 'Change the world by being yourself.',fav: "No"),
 QuoteModel(category: 'Motivational',author: 'Rasmus L',quote: 'Every moment is a fresh beginning.',fav: "No"),
 QuoteModel(category: 'Passion',author: 'A Michael',quote: 'Never regret anything that made you smile.',fav: "No"),
 QuoteModel(category: 'Life',author: 'David W',quote: 'Die with memories, not dreams.',fav: "No"),
 QuoteModel(category: 'Powerful',author: 'Lev Arda',quote: 'Aspire to inspire before we expire.',fav: "No"),
 QuoteModel(category: 'Success',author: 'Ethan Os',quote: 'Everything you can imagine is real.',fav: "No"),
 QuoteModel(category: 'Positivity',author: 'Li Gabriel',quote: 'Simplicity is the ultimate sophistication.',fav: "No"),
 QuoteModel(category: 'Believe',author: 'Jack In',quote: 'Whatever you do, do it well.',fav: "No"),
 QuoteModel(category: 'Motivational',author: 'Mehmet D',quote: 'What we think, we become.',fav: "No"),
 QuoteModel(category: 'Passion',author: 'V Lukas',quote: 'All limitations are self-imposed.',fav: "No"),
 QuoteModel(category: 'Life',author: 'Jan Noah',quote: 'Walk away from anything or anyone who takes away from your joy. Life is too short to put up with fools',fav: "No"),
 QuoteModel(category: 'Powerful',author: 'Mangus',quote: 'Life is short, live it. Love is rare, grab it. Anger is bad, dump it. Fear is awful, face it. Memories are sweet, cherish them',fav: "No"),
 QuoteModel(category: 'Success',author: 'Rasmus L',quote: 'If you cannot do great things, do small things in a great way.',fav: "No"),
 QuoteModel(category: 'Positivity',author: 'A Michael',quote: 'What lies behind us and what lies before us are tiny matters compared to what lies within us.',fav: "No"),
 QuoteModel(category: 'Believe',author: 'David W',quote: 'It is never too late to be what you might have been.',fav: "No"),
 QuoteModel(category: 'Motivational',author: 'Lev Arda',quote: 'Never let your memories be greater than your dreams.',fav: "No"),
 QuoteModel(category: 'Passion',author: 'Ethan Os',quote: 'It\'s not whether you get knocked down, it\'s whether you get up.',fav: "No"),
 QuoteModel(category: 'Life',author: 'Li Gabriel',quote: 'The creation of a thousand forests is in one acorn.',fav: "No"),
 QuoteModel(category: 'Powerful',author: 'Jack In',quote: 'Just keep going. Everybody gets better if they keep at it.',fav: "No"),
 QuoteModel(category: 'Success',author: 'Mehmet D',quote: 'The best way to predict the future is to invent it.',fav: "No"),
 QuoteModel(category: 'Positivity',author: 'V Lukas',quote: 'Very often a change of self is needed more than a change of scene.',fav: "No"),
 QuoteModel(category: 'Believe',author: 'Jan Noah',quote: 'Good things come to those who wait... greater things come to those who get off their ass and do anything to make it happen.',fav: "No"),
 QuoteModel(category: 'Motivational',author: 'Mangus',quote: 'Tough times never last but tough people do.',fav: "No"),
 QuoteModel(category: 'Passion',author: 'Rasmus L',quote: 'Problems are not stop signs, they are guidelines.',fav: "No"),
 QuoteModel(category: 'Life',author: 'A Michael',quote: 'Have enough courage to start and enough heart to finish.',fav: "No"),
 QuoteModel(category: 'Powerful',author: 'David W',quote: 'Hate comes from intimidation, love comes from appreciation.',fav: "No"),
  ];

  List<String> tempDATA = [
   "Believe and act as if it were impossible to fail.",
   "What you do speaks so loudly that I cannot hear what you say.",
   "Love For All, Hatred For None." ,
   "Change the world by being yourself.",
   "Every moment is a fresh beginning.",
   "Never regret anything that made you smile." ,
   "Die with memories, not dreams." ,
   "Aspire to inspire before we expire." ,
   "Everything you can imagine is real." ,
   "Simplicity is the ultimate sophistication." ,
   "Whatever you do, do it well." ,
   "What we think, we become." ,
   "All limitations are self-imposed." ,
   "Tough times never last but tough people do." ,
   "Problems are not stop signs, they are guidelines." ,
   "Have enough courage to start and enough heart to finish." ,
   "Hate comes from intimidation, love comes from appreciation."
  "Walk away from anything or anyone who takes away from your joy. Life is too short to put up with fools",
  "Life is short, live it. Love is rare, grab it. Anger is bad, dump it. Fear is awful, face it. Memories are sweet, cherish them",
  "If you cannot do great things, do small things in a great way.",
  "What lies behind us and what lies before us are tiny matters compared to what lies within us.",
  "It is never too late to be what you might have been.",
  "Never let your memories be greater than your dreams.",
  "It's not whether you get knocked down, it's whether you get up.",
  "The creation of a thousand forests is in one acorn.",
  "Just keep going. Everybody gets better if they keep at it.",
  "The best way to predict the future is to invent it.",
  "Very often a change of self is needed more than a change of scene.",
  "Good things come to those who wait... greater things come to those who get off their ass and do anything to make it happen.",
  "Obsessed is just a word the lazy use to describe the dedicated." ,
  "Even if you fall on your face, you're still moving forward.",
  "I cannot give you the formula for success, but I can give you the formula for failure--which is: Try to please everybody.",
  "To avoid criticism, do nothing, say nothing, be nothing.",
  "What we fear doing most is usually what we most need to do.",
  "Believe you can and you're halfway there.",
  "Believe and act as if it were impossible to fail.",
  "What you do speaks so loudly that I cannot hear what you say.",
  "Love For All, Hatred For None." ,
  "Change the world by being yourself.",
  "Every moment is a fresh beginning.",
  "Never regret anything that made you smile." ,
  "Die with memories, not dreams." ,
  "Aspire to inspire before we expire." ,
  "Everything you can imagine is real." ,
  "Simplicity is the ultimate sophistication." ,
  "Whatever you do, do it well." ,
  "What we think, we become." ,
  "All limitations are self-imposed." ,
   "Walk away from anything or anyone who takes away from your joy. Life is too short to put up with fools",
   "Life is short, live it. Love is rare, grab it. Anger is bad, dump it. Fear is awful, face it. Memories are sweet, cherish them",
   "If you cannot do great things, do small things in a great way.",
   "What lies behind us and what lies before us are tiny matters compared to what lies within us.",
   "It is never too late to be what you might have been.",
   "Never let your memories be greater than your dreams.",
   "It's not whether you get knocked down, it's whether you get up.",
   "The creation of a thousand forests is in one acorn.",
   "Just keep going. Everybody gets better if they keep at it.",
   "The best way to predict the future is to invent it.",
   "Very often a change of self is needed more than a change of scene.",
   "Good things come to those who wait... greater things come to those who get off their ass and do anything to make it happen.",
  "Tough times never last but tough people do." ,
  "Problems are not stop signs, they are guidelines." ,
  "Have enough courage to start and enough heart to finish." ,
  "Hate comes from intimidation, love comes from appreciation."

  ];

  void convertDATA()
  {
    String cate = "";
    String auth = "";
    print(tempDATA.length);
    for(int i = 0 ; i<tempDATA.length ; i++)
      {
        if(i%7==0)
          {
            cate = "Success";
          }
        else if(i%7==1)
          {
            cate = "Positivity";
          }
       else if(i%7==2)
        {
          cate = "Believe";
        }
        else if(i%7==3)
        {
          cate = "Motivational";
        }
        else if(i%7==4)
        {
          cate = "Passion";
        }
        else if(i%7==5)
        {
          cate = "Life";
        }
        else if(i%7==6)
        {
          cate = "Powerful";
        }




        if(i%11==0)
         {
          auth = "Jack In";
         }
        else if(i%11==1)
         {
          auth = "Mehmet D";
         }
        else if(i%11==2)
         {
          auth = "V Lukas";
         }
        else if(i%11==3)
         {
          auth = "Jan Noah";
         }
        else if(i%11==4)
         {
          auth = "Mangus";
         }
        else if(i%11==5)
         {
          auth = "Rasmus L";
         }
        else if(i%11==6)
         {
          auth = "A Michael";
         }
        else if(i%11==7)
         {
          auth = "David W";
         }
        else if(i%11==8)
         {
          auth = "Lev Arda";
         }
        else if(i%11==9)
         {
          auth = "Ethan Os";
         }
        else if(i%11==10)
         {
          auth = "Li Gabriel";
         }

        print('QuoteModel(category: \'$cate\',author: \'$auth\',quote: \'${tempDATA[i]}\',fav: "No"),');
        cate = "";

      }
  }

*/