import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/features/home/data/models/one_product_model.dart';
import 'package:http/http.dart' as http;

class OneProductApi {
  static getOneProduct(String productID) async {
    final respone = await Dio().get(
        "https://test.customer.api.delever.uz/v2/product/$productID",
        options: Options(
            headers: {'shipper': 'd4b1658f-3271-4973-8591-98a82939a664'}));

    final product = OneProductModel.fromJson(respone.data);

    if (product.hasModifier) {
      await Dio().get("$baseUrl/v2/modifier/",
          queryParameters: {'product_id': productID},
          options: Options(
              headers: {'shipper': 'd4b1658f-3271-4973-8591-98a82939a664'}));
    }
    if (product.type == 'combo') {
      await Dio().get("$baseUrl/v2/combo/",
          options: Options(
              headers: {'shipper': 'd4b1658f-3271-4973-8591-98a82939a664'}));
    }

    return product;
  }
}
