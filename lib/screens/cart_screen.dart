// import 'package:ecommerce/apis/product_api.dart';
// import 'package:ecommerce/utilities/colors.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   ProductAPi productAPi = ProductAPi();
//   List<String> categoriesList = [];

//   @override
//   void initState() {
//     getCategories();
//     super.initState();
//   }

//   getCategories() async {
//     categoriesList = await productAPi.fetchCategories();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: primaryColor,
//       appBar: AppBar(
//         title: const Text("Cart Screen"),
//       ),
//       body: ListView.builder(
//           itemCount: categoriesList.length,
//           itemBuilder: (context, index) {
//             return CupertinoListTile.notched(
//                 title: Text(categoriesList[index]));
//           }),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}