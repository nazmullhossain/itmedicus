import 'package:flutter/material.dart';
import 'package:itmedicusapp/providers/product_provider.dart';
import 'package:itmedicusapp/ui/screens/show_product_screen.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel productModel;

  const ProductWidget(this.productModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) =>
                    ShowProductScreen(productModel: productModel))));
      }),
      child: Container(
        decoration: BoxDecoration(
            color: !Provider.of<ProductProvider>(context).isDark
                ? Colors.blue[100]
                : null,
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        child: ListTile(

          leading: productModel.image == null
              ? Container(
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(8)),
                  height: double.infinity,
                  width: 70,
                  child: const Center(
                      child: CircleAvatar(
                    backgroundImage: AssetImage('images/food_logo.png'),
                  )))
              : Image.file(
            productModel.image!,
                  width: 70,
                  height: double.infinity,
                ),
          title: Text(productModel.name),
          subtitle: Text(productModel.subtitle),
          trailing: Column(
            children: [
              Text('${productModel.currentDate}'),
        Text(" ${productModel.stock}"),
            ],
          ),


        ),
      ),
    );
  }
}
//file