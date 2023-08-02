// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:ecommerce/apis/product_api.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/utilities/colors.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductAPi productAPi = ProductAPi();
  //Creating object of ProductAPi class here
  List<ProductModel> productList = [];

  @override
  void initState() {
    if (mounted) {
      Future.delayed(Duration(seconds: 1), () => getProducts());
      super.initState();
    }
  }

  getProducts() async {
    productList = await productAPi.fetchProducts();
    //Api call garera uta ko (Product_api.dart ko) productLists lai yo product list ma haleko
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text("Products"),
        centerTitle: true,
      ),
      body: GridView.builder(
          itemCount: productList.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            final product = productList[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        product.image,
                        height: 96,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 20,
                        child: Text(
                          product.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
