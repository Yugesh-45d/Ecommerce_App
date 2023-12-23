// ignore_for_file: public_member_api_docs, sort_constructors_first
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
