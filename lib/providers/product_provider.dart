import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data_repository/dbHelper.dart';
import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  ProductProvider() {
    getProduct();
  }

  bool isDark = false;
  changeIsDark() {
    isDark = !isDark;
    notifyListeners();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController subtitleColumnController = TextEditingController();

  File? image;
  String catgories = "Stock";

  List<ProductModel> allProduct = [];
  List<ProductModel> favoriteRecipes = [];
  getProduct() async {
    allProduct = await DbHelper.dbHelper.getAllRecipes();

    notifyListeners();
  }

  insertNewProduct() {
    ProductModel productModel = ProductModel(
      stock: catgories ,
        currentDate: DateFormat('yyyy-MM-dd').format(DateTime.now()),
        name: nameController.text,
        isFavorite: false,
        image: image,
        subtitle: subtitleColumnController.text,


    );
    DbHelper.dbHelper.insertNewProduct(productModel);
    getProduct();
  }



  deleteProduct(ProductModel productModel) {
    DbHelper.dbHelper.deleteRecipe(productModel);
    getProduct();
  }
}
