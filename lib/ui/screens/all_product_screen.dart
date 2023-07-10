import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/product_provider.dart';
import '../widgets/product_widget.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return ListView.builder(
            itemCount: provider.allProduct.length,
            itemBuilder: (context, index) {
              return ProductWidget(provider.allProduct[index]);
            });
      },
    );
  }
}
