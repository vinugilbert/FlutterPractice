import 'dart:ffi';
import 'dart:math';

import 'package:flutter_pratice/database/db_models/product_list_dbmodel.dart';
import 'package:flutter_pratice/models/products_list.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/transaction_model.dart';
class ProductDatatbase
{
  static final ProductDatatbase instance=ProductDatatbase._init();

  static Database? _database;
  ProductDatatbase._init();

  Future<Database> get database async {
    if(_database!=null) return _database!;

    _database=await _initDB("products.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async{
    final dbPath=await getDatabasesPath();
    final path=join(dbPath,filePath);
    return await openDatabase(path,version: 1,onCreate: _createDB);
  }
  Future _createDB(Database db,int version) async
  {
    final idType="INTEGER PRIMARY KEY AUTOINCREMENT";
    final textType="TEXT";
    final intType="INTEGER NOT NULL";

    await db.execute('''CREATE  TABLE $tableProducts(${ProductListFields.id } $idType,
        ${ProductListFields.itemName} $textType,
        ${ProductListFields.desc} $textType,
        ${ProductListFields.price} $textType,
        ${ProductListFields.expiryDate} $textType,
        ${ProductListFields.currency} $textType,
        ${ProductListFields.quantity} $textType)
       ''' );

  }

  Future<List<DbProducts>> readAllTransactions() async {
    final db = await instance.database;
    final orderBy = '${ProductListFields.itemName} ASC';
    final result = await db.query(tableProducts, orderBy: orderBy);
    return result.map((json) => DbProducts.fromJson(json)).toList();
  }

  insertData(List<Datum>? data) async {
    final db = await instance.database;
    List<DbProducts> db_List=[];
    data?.forEach((element) {
      DbProducts dbProducts= DbProducts();
      dbProducts.itemName=element.itemName;
      dbProducts.quantity=element.quantity;
      dbProducts.expiryDate=element.expiryDate;
      dbProducts.currency=element.currency;
      dbProducts.price=element.price.toString();
      dbProducts.desc=element.desc;
      db_List.add(dbProducts);
    });
    db_List.forEach((element) async{
      await db.insert(tableProducts, element.toJson());
    });
  }

  Future<void> insertProductList(List<Products> products) async {
    final db = await instance.database;
   List<DbProducts> db_List=[];
   products.forEach((element) {
     DbProducts dbProducts= DbProducts();
     dbProducts.itemName=element.itemName;
     dbProducts.quantity=element.quantity;
     dbProducts.expiryDate=element.expiryDate;
     dbProducts.currency=element.currency;
     dbProducts.price=element.price.toString();
     dbProducts.desc=element.desc;
     db_List.add(dbProducts);
   });

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');
    db_List.forEach((element) async{
      await db.insert(tableProducts, element.toJson());
    });



  }

/*  Future<List<Products>> readProduct(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableProducts,
      columns: ProductListFields.values,
      where: '${ProductListFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Products.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }*/


  Future<List<DbProducts>> readAllProducts() async {
    final db = await instance.database;

    final orderBy = '${ProductListFields.itemName} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableProducts, orderBy: orderBy);

    return result.map((json) => DbProducts.fromJson(json)).toList();
  }
  Future<int?> checkifTableEmpty() async
  {
    final db = await instance.database;
    int? count=  Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $tableProducts'));
return count;
  }



  Future close() async
  {
    final db= await instance.database;
    db.close();
  }
}