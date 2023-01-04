import 'package:dio/dio.dart';
import 'package:ploff_mobile/datasouse/models/banner_model.dart';

class BannersApi {
  static Future<BannersModel> getBanners() async {
    final respone = await Dio().get(
        "https://test.customer.api.delever.uz/v1/banner",
        options: Options(
            headers: {'shipper': 'd4b1658f-3271-4973-8591-98a82939a664'}));

    final banner = BannersModel.fromJson(respone.data);
    return banner;
  }
}