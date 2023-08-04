import 'package:ecommerce/models/cart_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> cartList = [];
  static int totalquantity = 0;

  void addToCart(CartModel cart) {
    cartList.add(cart);
    // print(cartList.last.quantity);
    totalquantity += cart.quantity;
    print(totalquantity);
    notifyListeners();
  }

  int getTotalQuantity(){
    totalquantity += cartList.last.quantity;
    return totalquantity;
  }
}
