// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProductScreenDetail extends StatelessWidget {
  const ProductScreenDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Title"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Product Screen Detail",
        ),
      ),
    );
  }
}
