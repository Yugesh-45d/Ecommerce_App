import 'package:ecommerce/models/product_model.dart';

class CartModel {
  final int id;
  final ProductModel product;
  late int quantity;

  CartModel({
    required this.id,
    required this.product,
    required this.quantity,
  });
}
