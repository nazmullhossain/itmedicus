import 'dart:io';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:itmedicusapp/ui/screens/search_product_screen.dart';

import '../../providers/product_provider.dart';
import '../widgets/product_widget.dart';
import 'home_page.dart';

class MainProductScreen extends StatelessWidget {
  const MainProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
        builder: (BuildContext context, myProvider, Widget? child) => Scaffold(
              appBar: AppBar(
              leading: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                },
                child: Image.asset('images/bck.png',color: Colors.white,),
              ),
                title: const Text('My Product'),
                actions: [
                  InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => SearchProductScreen(
                              products: myProvider.allProduct)))),
                      child: const Icon(Icons.search)),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Text("Search"),
                  )
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: (() async {
                  await Navigator.pushNamed(context, '/new_product_screen');
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacementNamed(
                      context, '/main_product_screen');
                }),
                child: const Icon(Icons.add),
              ),
              body: ListView.builder(
                  itemCount: myProvider.allProduct.length,
                  itemBuilder: (context, index) {
                    return ProductWidget(myProvider.allProduct[index]);
                  }),
            ));
  }
}
