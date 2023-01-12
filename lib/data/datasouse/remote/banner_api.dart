import 'package:dio/dio.dart';
import 'package:ploff_mobile/data/models/banner_model.dart';

class BannersApi {
  static Future<List<Banner>> getBanners() async {
    final respone = await Dio().get(
        "https://test.customer.api.delever.uz/v1/banner",
        options: Options(
            headers: {'shipper': 'd4b1658f-3271-4973-8591-98a82939a664'}));

    final data = respone.data['banners'] as List;
    List<Banner> banners = data.map((e) => Banner.fromJson(e)).toList();

    return banners;
  }
}
