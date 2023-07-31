// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:ecommerce/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Practice_Widget extends StatelessWidget {
  const Practice_Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 160,
                width: 120,
                color: primaryColor,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/1.jpg",
                  height: 136,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Mero Store",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              SizedBox(
                height: 48,
                width: 120,
                child: Text(
                  "Discover exquisite fashion trends at our premium store.",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Image.asset(
                    "assets/ratings.png",
                    height: 20,
                    // fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Card(
                    color: primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 1, bottom: 1),
                      child: Text(
                        "4.0",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    "Rs 99",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Icon(
                    CupertinoIcons.cart_fill_badge_plus,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
