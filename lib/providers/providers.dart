import 'dart:developer';

import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> cartList = [];
  int totalquantity = 0;
  List<ProductModel> productList = [];

  void addToCart(CartModel cart) {
    bool productExists =
        cartList.any((item) => item.product.id == cart.product.id);

    if (productExists) {
      cartList
          .firstWhere((item) => item.product.id == cart.product.id)
          .quantity += cart.quantity;
    } else {
      cartList.add(cart);
    }
    totalquantity += cart.quantity;
    notifyListeners();
  }
}
