import 'package:dio/dio.dart';
import 'package:ploff_mobile/features/backet/data/models/product_model.dart';

class ProductApiBac {
   static getOneProduct() async {
    final respone = await Dio().get(
        "https://test.customer.api.delever.uz/v2/category-with-products?page=1&limit=10&all=true",
        options: Options(
            headers: {'shipper': 'd4b1658f-3271-4973-8591-98a82939a664'}));
    print(respone.data);

    final product = ProductModel.fromJson(respone.data);

    return product;
  }
}