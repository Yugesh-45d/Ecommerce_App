import 'dart:async';

import 'package:ecommerce/apis/product_api.dart';
import 'package:ecommerce/providers/providers.dart';
import 'package:ecommerce/screens/main_page.dart';
import 'package:ecommerce/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Timer(Duration(seconds: 2), () {
    //   Navigator.pushReplacement(
    //       context,
    //       (MaterialPageRoute(builder: (context) {
    //         return MainScreen();
    //       })));
    // });

    ProductAPi productAPi = ProductAPi();

    Future<void> getProducts() async {
      Provider.of<CartProvider>(context, listen: false).productList =
          await productAPi.fetchProducts();
    }

    Column getDetails() {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context,
            (MaterialPageRoute(builder: (context) {
              return const MainScreen();
            })));
      });
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ShopLogo(),
              SizedBox(height: 24.h),
              const ShopName(),
            ],
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: secondaryColor,
      body: Center(
        child: FutureBuilder(
          future: getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text(
                snapshot.error.toString(),
              );
            } else {
              return getDetails();
            }
          },
        ),
      ),
    );
  }
}

class ShopName extends StatelessWidget {
  const ShopName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Mero Pasal",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: mainColor,
        fontSize: 36.sp,
      ),
    );
  }
}

class ShopLogo extends StatelessWidget {
  const ShopLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/shop.png");
  }
}
