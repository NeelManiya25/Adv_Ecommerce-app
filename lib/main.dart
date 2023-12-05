import 'package:flutter/material.dart';
import 'package:neel/controller/provider/api_controller.dart';
import 'package:neel/views/screens/cart_page.dart';
import 'package:neel/views/screens/deatils_page.dart';
import 'package:neel/views/screens/homepage.dart';
import 'package:provider/provider.dart';
import 'controller/provider/add-remove_cart.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CartProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => Product_provider(),
      ),
    ],
    builder: (context, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomePage(),
          'Details_page': (context) => Details_page(),
          'cart_page': (context) => cart_page(),
        },
      );
    },
  ));
}
