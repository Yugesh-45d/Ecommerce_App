import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/providers/providers.dart';
import 'package:ecommerce/screens/product_screen_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchQuery = '';

  bool check = false;

  List<ProductModel> filteredProducts = [];

  List<ProductModel> meroProductModel = [];

  void searchProducts(String query) {
    setState(() {
      filteredProducts = meroProductModel
          .where((product) =>
              product.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Screen'),
      ),
      body: Consumer<CartProvider>(builder: (context, value, child) {
        meroProductModel = value.productList;
        return Padding(
          padding: EdgeInsets.all(8.0.h),
          child: Column(
            children: [
              SizedBox(height: 8.h),
              CupertinoSearchTextField(
                placeholder: "Enter product name",
                onChanged: (data) {
                  searchQuery = data;
                  setState(() {
                    searchProducts(searchQuery);
                  });
                },
              ),
              SizedBox(height: 16.h),
              productList(),
            ],
          ),
        );
      }),
    );
  }

  Expanded productList() {
    return Expanded(
      child: ListView.builder(
        itemCount: filteredProducts.isEmpty
            ? meroProductModel.length
            : filteredProducts.length,
        itemBuilder: (context, index) {
          final product = filteredProducts.isEmpty
              ? meroProductModel[index]
              : filteredProducts[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductScreenDetail(
                            products: product,
                          )));
            },
            leading: Image.network(
              product.image,
              height: 40.h,
              width: 40.w,
            ),
            title: Text(
              product.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
              ),
            ),
            subtitle: Text(
              "\$${product.price.toString()}",
              style: TextStyle(
                color: Colors.green,
                fontSize: 14.sp,
              ),
            ),
            trailing: Text(
              product.rating.rate.toString(),
              style: TextStyle(
                color: Colors.yellow.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
