import 'package:flutter/material.dart';
import 'package:itmedicusapp/models/product_model.dart';
import 'package:itmedicusapp/providers/product_provider.dart';
import 'package:provider/provider.dart';



class ShowProductScreen extends StatelessWidget {
  final ProductModel productModel;

  const ShowProductScreen({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
        builder: ((context, provider, child) => Scaffold(
              appBar: AppBar(
                actions: [
                  InkWell(
                      onTap: () {
                        provider.nameController.text = productModel.name;

                        provider.subtitleColumnController.text =
                            productModel.subtitle;

                        provider.image = productModel.image;

                      },
                      child: const Icon(Icons.edit)),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {
                        provider.deleteProduct(productModel);
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.delete)),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(5)),
                    height: 170,
                    //width: double.infinity,
                    child: productModel.image == null
                        ? const Center(
                            child: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('images/food_logo.png'),
                          ))
                        : Image.file(
                      productModel.image!,
                          ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      productModel.name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        const Text(
                          'Preperation time :',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${productModel.subtitle}',
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: !Provider.of<ProductProvider>(context).isDark
                            ? Colors.blue[100]
                            : null,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ingredients',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: !Provider.of<ProductProvider>(context).isDark
                            ? Colors.blue[100]
                            : null,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Instructions',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                      ],
                    ),
                  ),
                ]),
              ),
            )));
  }
}
