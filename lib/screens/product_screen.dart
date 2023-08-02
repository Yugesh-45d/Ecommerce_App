// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:ecommerce/apis/product_api.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
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
      Future.delayed(Duration(seconds: 2), () => getProducts());
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

            return Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/product-detail");
                  },
                  child: Card(
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.network(
                            product.image,
                            height: 104,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            product.title,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              overflow: TextOverflow.clip,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${product.rating.rate}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow.shade700,
                                    size: 22,
                                  ),
                                ],
                              ),
                              Text(
                                "Rs ${product.price}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 12,
                  child: Icon(
                    CupertinoIcons.cart_badge_plus,
                    size: 26,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
