import 'package:dio/dio.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/features/design_order/data/models/customer_adress_model.dart';
import 'package:ploff_mobile/features/design_order/data/models/nearest_branch_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DesigOrderApi {
  static getNearestBranch() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    // final accesToken = preferences.getString('acces_token');
    String acscestoken =
        '''eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NzU0MjMzNjUsImlhdCI6MTY3NDEyNzM2NSwiaXNzIjoidXNlciIsInNoaXBwZXJfaWQiOiJkNGIxNjU4Zi0zMjcxLTQ5NzMtODU5MS05OGE4MjkzOWE2NjQiLCJzdWIiOiJhODA3MTgyOS1jYTI0LTRjM2YtODU3ZS1lZTA0MjE5ZjUzYTgiLCJ1c2VyX3R5cGVfaWQiOiI5YjMxMjg2ZC1kYzIxLTQ1NzItYjIwYy05YjZjYjdkMjlkODkifQ.xFRPNwupNOp9bzcWXmCrucj4DrbROniBbcEIGqHVJp0''';

    final lat = preferences.getString('lat');
    final long = preferences.getString('long');
    final res = await Dio().get('$baseUrl/v1/nearest-branch',
        queryParameters: {"long": "$long", "lat": "$lat"},
        options: Options(headers: {
          'shipper': shipperId,
          'Authorization': acscestoken,
        }));
    final nearestBranch = NearestBranchModel.fromJson(res.data);

    return nearestBranch;
  }

  static Future<CustomerAdressModel> getCustomerAdress() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final accesToken = preferences.getString('access_token');
    final cusotmerId = preferences.getString('customer_id');

    final res = await Dio().get('$baseUrl/v1/customer_address',
        queryParameters: {"customer_id": cusotmerId},
        options: Options(headers: {
          'shipper': shipperId,
          'Authorization': accesToken,
        }));
        final CustomerAdressModel cusomerAdress = CustomerAdressModel.fromJson(res.data);
        

    preferences.setString(
        'lat', res.data['customer_addresses'][0]['location']['lat'].toString());
    preferences.setString('long',
        res.data['customer_addresses'][0]['location']['long'].toString());

    await Dio().get('$baseUrl/v1/shippers/$shipperId');

    return cusomerAdress;
  }
}
