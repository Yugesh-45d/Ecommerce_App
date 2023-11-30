// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce/providers/providers.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/screens/main_page.dart';
import 'package:ecommerce/screens/product_screen_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CartProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Ecommerce",
        home: MainScreen(),
        // initialRoute: '/',
        // routes: {
        //   "/": (context) => MainScreen(),
        //   "/product-detail": (context) => ProductScreenDetail(),
        //   '/cart-screen' :(context) => CartScreen(),
        // },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 248, 248, 248),
          ),
          useMaterial3: false,
        ),
      ),
    ),
  );
}
