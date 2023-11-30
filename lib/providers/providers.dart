import 'package:ecommerce/models/cart_model.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> cartList = [];
  int totalquantity = 0;
  List<ProductModel> productList = [];

  void addToCart(CartModel cart) {
    cartList.add(cart);
    totalquantity += cartList.last.quantity;
    notifyListeners();
  }
}
