import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/providers/providers.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/screens/product_screen_detail.dart';
import 'package:ecommerce/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          title: const Text("Mero Shop"),
          actions: [
            cartLogoAtTop(context, value),
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 24.h),
            itemsToBeCarted(value),
          ],
        ),
      ),
    );
  }

  Expanded itemsToBeCarted(CartProvider value) {
    return Expanded(
      child: GridView.builder(
          itemCount: value.productList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            final product = value.productList[index];
            return itemDetails(context, product, value);
          }),
    );
  }

  Stack itemDetails(
      BuildContext context, ProductModel product, CartProvider value) {
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
          child: Padding(
            padding:
            EdgeInsets.all(4.r),
            child: Card(
              elevation: 8,
              child: Padding(
                padding: EdgeInsets.all(6.0.r),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Hero(
                      tag: product.id,
                      child: Image.network(
                        product.image,
                        height: 96.h,
                        width: 96.w,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      product.title,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        overflow: TextOverflow.clip,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "${product.rating.rate}",
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.grey,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                              size: 22.h,
                            ),
                          ],
                        ),
                        Text(
                          "\$ ${product.price}",
                          style: TextStyle(
                            fontSize: 18.sp,
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
                const SnackBar(
                  backgroundColor: greenColor,
                  content: Text(
                    "1 new item(s) have been added to your cart",
                    style: TextStyle(),
                  ),
                  duration: Duration(
                    milliseconds: 250,
                  ),
                ),
              );
            },
            icon: Icon(
              CupertinoIcons.cart_badge_plus,
              size: 26.h,
            ),
          ),
        ),
      ],
    );
  }

  Stack cartLogoAtTop(BuildContext context, CartProvider value) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0.h),
          child: IconButton(
            icon: const Icon(CupertinoIcons.cart_fill),
            onPressed: () {
              Navigator.push(
                  context,
                  (MaterialPageRoute(
                      builder: (context) => const CartScreen())));
            },
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            height: 20.h,
            width: 20.w,
            decoration: BoxDecoration(
                color: greenColor, borderRadius: BorderRadius.circular(24)),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                value.totalquantity.toString(),
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
