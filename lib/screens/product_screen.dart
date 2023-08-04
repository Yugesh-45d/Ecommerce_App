// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:ecommerce/apis/product_api.dart';
import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/providers/providers.dart';
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
  ProductAPi productAPi = ProductAPi();
  //Creating object of ProductAPi class here
  List<ProductModel> productList = [];
  bool isLoading = false;

  @override
  void initState() {
    // Future.delayed(Duration(seconds: 1), () => getProducts());
    getProducts();

    super.initState();
  }

  getProducts() async {
    isLoading = true;

    productList = await productAPi.fetchProducts();
    //Api call garera uta ko (Product_api.dart ko) productLists lai yo product list ma haleko
    isLoading = false;

    setState(() {});
  }

  CartModel getcart(int id, final product) {
    return CartModel(id: id, product: product, quantity: 1);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: Text("Products"),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.shopping_basket),
                onPressed: () {
                  Navigator.of(context).pushNamed("/cart-screen");
                }),
          ],
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                itemCount: productList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final product = productList[index];
                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/product-detail",
                              arguments: product);
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
                            context
                                .read<CartProvider>()
                                .addToCart(getcart(product.id, product));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "1 new item(s) have been added to your cart",
                                  style: TextStyle(),
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
