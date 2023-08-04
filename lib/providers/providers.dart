import 'package:ecommerce/models/cart_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> cartList = [];

  void addToCart(CartModel cart) {
    cartList.add(cart);
    double price = 0;
    for (var items in cartList) {
      price += items.product.price;
    }
    print(price);
    notifyListeners();
  }
}
