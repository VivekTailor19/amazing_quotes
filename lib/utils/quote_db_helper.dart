import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:quotopia/model/quote_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class Quote_DB_Helper
{
  static Quote_DB_Helper quote_db_helper = Quote_DB_Helper();

  Database? database;

  final dbPath = "quote.db";
  final dbName = "quoteTable";

  Future<Database?> checkDB()
  async {
    if(database!= null)
      {
        return database ;
      }
    else
      {
        return await builtDB();
      }
  }

  Future<Database> builtDB()
  async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path,dbPath);
    String query = 'CREATE TABLE $dbName (ID INTEGER PRIMARY KEY AUTOINCREMENT, category TEXT, author TEXT, quote TEXT, fav TEXT)' ;

    return await openDatabase(path,version:1,
    onCreate: (db, version) async {
      return await db.execute(query);
    },);
  }

  Future<void> insertInDB(QuoteModel model)
  async {
    database = await checkDB();
    await database!.insert(dbName,
        {
          "category":model.category,
          "author":model.author,
          "quote": model.quote,
          'fav':model.fav
        }
    );
  }


}