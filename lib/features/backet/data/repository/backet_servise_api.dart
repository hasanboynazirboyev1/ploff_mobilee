import 'package:dio/dio.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BacketServiseApi {
  static getCustomerAdress() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final accesToken = preferences.getString('access_token');
    final cusotmerId = preferences.getString('customer_id');

    final a = await Dio().get('$baseUrl/v1/customer_address',
        queryParameters: {"customer_id": cusotmerId},
        options: Options(headers: {
          'shipper': shipperId,
          'Authorization': accesToken,
        }));

    // preferences.setString('lat', a.data['customer_addresses'][0]['location']['lat'].toString());
    // preferences.setString('long', a.data['customer_addresses'][0]['location']['long'].toString());

    final b = await Dio().get('$baseUrl/v1/shippers/$shipperId');
    print(a.data);
    print(b.data);
  }

  static getNearestBranch() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final accesToken = preferences.getString('acces_token');
    final lat = preferences.getString('lat');
    final long = preferences.getString('long');

    final res = await Dio().get(
      '$baseUrl/v1/nearest-branch',
      queryParameters: {"long": "-122.0839999", "lat": "37.42199849963666"},
       options: Options(headers: {
          'shipper': shipperId,
          'Authorization': accesToken,
        }));
    
    print("${res.data} ***********************");
    // return res;
  }

  static computePrice() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final accesToken = preferences.getString('acces_token');
    final lat = preferences.getString('lat');
    final long = preferences.getString('long');
    final res = await Dio().post('$baseUrl/v1/compute',
        queryParameters: {"lat": lat, "long": long},
        options: Options(headers: {
          'shipper': shipperId,
          'Authorization': accesToken,
        }));
  }

  static shippers() async {
    final res = await Dio().get('$baseUrl/v1/shippers/$shipperId');
    print(res.data);
  }

  static getComputePrice(Map<String, dynamic> map) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final accesToken = preferences.getString('acces_token');
    final lat = preferences.getString('lat');
    final long = preferences.getString('long');

    final res = await Dio().post('$baseUrl/v1/compute',
        data: map,
        queryParameters: {"lat": lat, "long": long},
        options: Options(headers: {
          'shipper': shipperId,
          'Authorization': accesToken,
        }));
  }
}
