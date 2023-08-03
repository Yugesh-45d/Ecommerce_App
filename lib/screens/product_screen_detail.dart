// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
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
                  "Rs ${product.price}",
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
                        if (quantity > 0) {
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
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Add to Cart",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
