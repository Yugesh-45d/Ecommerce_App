// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     ListView.builder(itemBuilder: (context, index) {
    //       return ListTile();
    //     }),
    //   ],
    // );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Shopping Cart"),
      ),
      // body: Column(
      //   children: [
      //     // Dismissible(key: key, child: child)
      //   ],
      // ),
    );
  }
}
