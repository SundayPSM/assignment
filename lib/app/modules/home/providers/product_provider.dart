import 'dart:convert';

import 'package:get/get.dart';
import 'package:morphos_assignment/app/modules/home/models/product_model.dart';
import 'package:morphos_assignment/app/modules/home/models/product_model.dart';

class ProductProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Product.fromJson(map);
      if (map is List)
        return map.map((item) => Product.fromJson(item)).toList();
    };
    httpClient.baseUrl =
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie';
  }

  Future<List<dynamic>> getProducts() async {
    try {
      final response = await get(
          "https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie");
      return (response.body);
    } catch (e) {
      Get.snackbar("Warning", "Please check our internet");

      print(e.toString());
      return [];
    }
  }

  Future<Product?> getProduct(int id) async {
    final response = await get('product/$id');
    return response.body;
  }

  Future<Response<Product>> postProduct(Product product) async =>
      await post('product', product);
  Future<Response> deleteProduct(int id) async => await delete('product/$id');
}
