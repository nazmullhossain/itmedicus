import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../widgets/product_widget.dart';



class SearchProductScreen extends StatefulWidget {
  final List<ProductModel> products;
  List<ProductModel> filteredProducts = [];

  SearchProductScreen({super.key, required this.products}) {
    filteredProducts = products;
  }

  @override
  State<SearchProductScreen> createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  void filterProduct(value) {
    setState(() {
      widget.filteredProducts = widget.products
          .where((product) =>
          product.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            filterProduct(value);
          },
          decoration: const InputDecoration(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              hintText: "Search product",
              hintStyle: TextStyle(color: Colors.white)),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: widget.filteredProducts.isNotEmpty
            ? ListView.builder(
                itemCount: widget.filteredProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductWidget(widget.filteredProducts[index]);
                })
            : const Center(
                child: Text('product not found...'),
              ),
      ),
    );
  }
}
