// ignore_for_file: file_names
import 'dart:io';

import 'package:itmedicusapp/models/product_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  late Database database;
  static DbHelper dbHelper = DbHelper();
  final String tableName = 'products';
  final String nameColumn = 'name';

  final String idColumn = 'id';
  final String isFavoriteColumn = 'isFavorite';
  final String subtitleColumn = 'subtitle';


  final String imageColumn = 'image';
  final String birthColumn = 'currentDate';
  final String stockColumn = 'stock';

  initDatabase() async {
    database = await connectToDatabase();
  }

  Future<Database> connectToDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '$directory/recipes.db';
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $nameColumn TEXT,$stockColumn TEXT, $birthColumn TEXT, $isFavoriteColumn INTEGER, $subtitleColumn TEXT,  $imageColumn TEXT)');
      },
      onUpgrade: (db, oldVersion, newVersion) {
        db.execute(
            'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $nameColumn TEXT,$stockColumn TEXT, $birthColumn TEXT, $isFavoriteColumn INTEGER, $subtitleColumn TEXT, $imageColumn TEXT)');
      },
      onDowngrade: (db, oldVersion, newVersion) {
        db.delete(tableName);
      },
    );
  }

  Future<List<ProductModel>> getAllRecipes() async {
    List<Map<String, dynamic>> tasks = await database.query(tableName);
    return tasks.map((e) => ProductModel.fromMap(e)).toList();
  }

  insertNewProduct(ProductModel productModel) {
    database.insert(tableName, productModel.toMap());
  }

  deleteRecipe(ProductModel productModel) {
    database
        .delete(tableName, where: '$idColumn=?', whereArgs: [productModel.id]);
  }

  deleteProduct() {
    database.delete(tableName);
  }



}
