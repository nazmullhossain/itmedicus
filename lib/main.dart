import 'package:flutter/material.dart';

import 'package:itmedicusapp/providers/product_provider.dart';

import 'package:itmedicusapp/ui/screens/home_page.dart';
import 'package:itmedicusapp/ui/screens/main_product_screen.dart';
import 'package:itmedicusapp/ui/screens/new_product_screen.dart';


import 'package:provider/provider.dart';

import 'data_repository/dbHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),),


      ],
        child: const InitApp());
    
  }
}

class InitApp extends StatelessWidget {
  const InitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Task',
      home: const HomePage(),
      routes: {

        '/new_product_screen': (context) => const NewProductScreen(),
        '/main_product_screen': (context) => const MainProductScreen(),

      },
    );
  }
}
