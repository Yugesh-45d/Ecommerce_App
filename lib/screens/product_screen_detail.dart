import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/providers/providers.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductScreenDetail extends StatefulWidget {
  final ProductModel products;
  const ProductScreenDetail({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  State<ProductScreenDetail> createState() => _ProductScreenDetailState();
}

class _ProductScreenDetailState extends State<ProductScreenDetail> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final product = widget.products;

    CartModel getcart() {
      return CartModel(id: product.id, product: product, quantity: quantity);
    }

    return Consumer<CartProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            product.title,
            softWrap: true,
            maxLines: 1,
            overflow: TextOverflow.clip,
          ),
          actions: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      icon: const Icon(CupertinoIcons.cart_fill),
                      onPressed: () {
                        Navigator.push(
                            context,
                            (MaterialPageRoute(
                                builder: (context) => const CartScreen())));
                      }),
                ),
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: Container(
                    height: 20.h,
                    width: 20.w,
                    decoration: BoxDecoration(
                        color: greenColor,
                        borderRadius: BorderRadius.circular(24.r)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        value.totalquantity.toString(),
                        style:  TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Hero(
                tag: product.id,
                child: Image.network(product.image,
                    height: 240.h, width: double.maxFinite.w),
              ),
              SizedBox(
                height: 16.h,
              ),
              Chip(
                label: Text(product.category.name),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: mainColor),
                  borderRadius: BorderRadius.circular(16.r),
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
                height: 16.h
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "${product.rating.rate}",
                        style: TextStyle(
                          fontSize: 24.sp,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade700,
                        size: 24.h,
                      ),
                    ],
                  ),
                  Text(
                    "\$ ${product.price}",
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                      color: greenColor,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Quantity:",
                      style: TextStyle(fontSize: 20.sp),
                    ),
                    SizedBox(
                      width: 32.w
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
                          padding: EdgeInsets.only(
                            left: 6.w,
                            right: 6.w,
                          ),
                          child: Text(
                            "-",
                            style:
                                TextStyle(color: Colors.red, fontSize: 32.sp),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 32.w,
                    ),
                    Text(
                      quantity.toString(),
                      style: TextStyle(
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(width: 32.w),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
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
                height: 12.h,
              ),
              SizedBox(
                height: 48.h,
                width: double.maxFinite,
                child: Builder(builder: (context) {
                  return TextButton(
                    style: TextButton.styleFrom(
                      elevation: 8,
                      backgroundColor: greenColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.r),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        value.addToCart(getcart());
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: greenColor,
                          content: Text(
                            "$quantity new item(s) have been added to your cart",
                          ),
                          duration: const Duration(
                            milliseconds: 250,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
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
