import 'package:dio/dio.dart';
import 'package:ecommerce/config/api_constants.dart';
import 'package:ecommerce/models/product_model.dart';

class ProductAPi {
  final dio = Dio();

  fetchProducts() async {
    final response = await dio.get(ApiConstants.getProducts);
    //if there is data, resonse is OK
    if (response.statusCode == 200) {
      final data = response.data;
      //Data lai List banayo vane matra teslai map grna milxa
      final productLists =
          (data as List).map((e) => ProductModel.fromJson(e)).toList();
      //Yo line le JSON from ma API bata aayeko data lai ProductModel ma vaeko attributes ma haldinxa
      return productLists;
    }
  }

  // fetchCategories() async {
  //   final response = await dio.get(ApiConstants.getCategories);

  //   if (response.statusCode == 200) {
  //     final data = response.data;

  //     // final categoriesLists = categoryModelFromJson(data).toString();
  //     // final categoriesLists = data.map((e)=> categoryModelFromJson(data));
  //     final categoriesLists =
  //         (data as List).map((e) => categoryModelFromJson(e)).toList();
  //     return categoriesLists;
  //   }
  // }
}
