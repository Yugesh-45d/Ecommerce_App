// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, avoid_print

import 'package:ecommerce/apis/product_api.dart';
import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/providers/providers.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/screens/product_screen_detail.dart';
import 'package:ecommerce/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
 

  CartModel getcart(int id, final product) {
    return CartModel(id: id, product: product, quantity: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: Text(
            "Products",
          ),
          centerTitle: true,
          actions: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(CupertinoIcons.cart_fill),
                    onPressed: () {
                      Navigator.push(
                          context,
                          (MaterialPageRoute(
                              builder: (context) => CartScreen())));
                    },
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: greenColor,
                        borderRadius: BorderRadius.circular(24)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Builder(builder: (context) {
                        return Text(
                          value.totalquantity.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: GridView.builder(
                itemCount: value.productList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final product = value.productList[index];
                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductScreenDetail(
                                        products: product,
                                      )));
                        },
                        child: Card(
                          elevation: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Hero(
                                  tag: product.id,
                                  child: Image.network(
                                    product.image,
                                    height: 104,
                                    width: 104,
                                  ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "${product.rating.rate}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey,
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
                                      "\$ ${product.price}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: greenColor,
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
                        top: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              // context
                              //     .read<CartProvider>()
                              //     .addToCart(getcart(product.id, product));
                              value.addToCart(getcart(product.id, product));
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "1 new item(s) have been added to your cart",
                                  style: TextStyle(),
                                ),
                                duration: Duration(
                                  seconds: 1,
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            CupertinoIcons.cart_badge_plus,
                            size: 26,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
      ),
    );
  }
}
