import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../models/product_model.dart';

class ProductApi {
  static Future<List<Categorys>> getProducts() async {
    final respone = await Dio().get(
        "https://test.customer.api.delever.uz/v2/category-with-products?page=1&limit=10&all=true",
        options: Options(
            headers: {'shipper': 'd4b1658f-3271-4973-8591-98a82939a664'}));

    final data = respone.data as List;

    List<Categorys> category = data.map((e) => Categorys.fromJson(e)).toList();
    return category;
  }
  static Future<List<Product>> getCategory() async {
    final respone = await Dio().get(
        "https://test.customer.api.delever.uz/v2/category-with-products?page=1&limit=10&all=true",
        options: Options(
            headers: {'shipper': 'd4b1658f-3271-4973-8591-98a82939a664'}));

    final data = respone.data as List;

    List<Product> product = data.map((e) => Product.fromJson(e)).toList();
    return product;
  }
}

class ProducTestApi {
  static Future<ProductModel> getProducts() async {
    final respone = await Dio().get(
        "https://test.customer.api.delever.uz/v2/category-with-products?page=1&limit=10&all=true",
        options: Options(
            headers: {'shipper': 'd4b1658f-3271-4973-8591-98a82939a664'}));

    ProductModel product = ProductModel.fromJson(respone.data);
    return product;
  }
}
