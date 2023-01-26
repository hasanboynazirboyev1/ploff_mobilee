import 'package:dio/dio.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BacketServiseApi {
  static computePrice() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    // final accesToken = preferences.getString('acces_token');
    String acscestoken =
        '''eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NzU0MjMzNjUsImlhdCI6MTY3NDEyNzM2NSwiaXNzIjoidXNlciIsInNoaXBwZXJfaWQiOiJkNGIxNjU4Zi0zMjcxLTQ5NzMtODU5MS05OGE4MjkzOWE2NjQiLCJzdWIiOiJhODA3MTgyOS1jYTI0LTRjM2YtODU3ZS1lZTA0MjE5ZjUzYTgiLCJ1c2VyX3R5cGVfaWQiOiI5YjMxMjg2ZC1kYzIxLTQ1NzItYjIwYy05YjZjYjdkMjlkODkifQ.xFRPNwupNOp9bzcWXmCrucj4DrbROniBbcEIGqHVJp0''';
    final lat = preferences.getString('lat');
    final long = preferences.getString('long');
    final res = await Dio().post('$baseUrl/v1/compute',
        queryParameters: {"lat": lat, "long": long},
        options: Options(headers: {
          'shipper': shipperId,
          'Authorization': acscestoken,
        }));
    print(res.data);
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
