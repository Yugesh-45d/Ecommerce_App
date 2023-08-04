// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreenDetail extends StatefulWidget {
  const ProductScreenDetail({super.key});

  @override
  State<ProductScreenDetail> createState() => _ProductScreenDetailState();
}

class _ProductScreenDetailState extends State<ProductScreenDetail> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;

    CartModel getcart() {
      return CartModel(id: product.id, product: product, quantity: quantity);
    }

    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            product.title,
            maxLines: 1,
            overflow: TextOverflow.clip,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: product.id,
                child: Image.network(product.image,
                    height: 240, width: double.maxFinite),
              ),
              SizedBox(
                height: 16,
              ),
              Chip(
                label: Text(product.category.name),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "${product.rating.rate}",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade700,
                        size: 24,
                      ),
                    ],
                  ),
                  Text(
                    "\$ ${product.price}",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Quantity:",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 32,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (quantity > 1) {
                            quantity--;
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 6,
                            right: 6,
                          ),
                          child: Text(
                            "-",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 32,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 32,
                    ),
                    Text(
                      quantity.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 32,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            "+",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 48,
                width: double.maxFinite,
                child: Builder(builder: (context) {
                  return TextButton(
                    style: TextButton.styleFrom(
                      elevation: 8,
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    onPressed: () {
                      context.read<CartProvider>().addToCart(getcart());
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "$quantity new item(s) have been added to your cart",
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
