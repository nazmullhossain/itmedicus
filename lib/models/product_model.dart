import 'dart:io';

import 'package:intl/intl.dart';

class ProductModel {
  int? id;
  late String name;
  late String stock;
  late bool isFavorite;
  File? image;

  late String subtitle;


  String? currentDate;

  ProductModel({
    this.id,
    required this.name,
    required this.stock,
    required this.currentDate,
    required this.isFavorite,
    this.image,
    required this.subtitle,

  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'stock': stock,
      'currentDate': currentDate,
      'name': name,
      'isFavorite': isFavorite ? 1 : 0,
      'subtitle': subtitle,

      'image': image == null ? '' : image!.path
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
        id: map['id'],
        stock: map['stock'] ?? "",
        name: map['name'],
        currentDate: map['currentDate'],
        isFavorite: map['isFavorite'] == 1 ? true : false,

        subtitle: map['subtitle'],

        image: map['image'] != null ? File(map['image']) : null);
  }
}
