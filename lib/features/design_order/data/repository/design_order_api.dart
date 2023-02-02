import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/features/backet/data/datasourse/local/hive/hive_boxses.dart';
import 'package:ploff_mobile/features/design_order/data/models/customer_adress_model.dart';
import 'package:ploff_mobile/features/design_order/data/models/nearest_branch_model.dart';
import 'package:ploff_mobile/features/order/data/models/product_order_model.dart';
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

  static getCustomerAdress() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    final accesToken = preferences.getString('access_token');
    final cusotmerId = preferences.getString('customer_id');

    try {
      final res = await Dio().get('$baseUrl/v1/customer_address',
          queryParameters: {"customer_id": cusotmerId},
          options: Options(headers: {
            'shipper': shipperId,
            'Authorization': accesToken,
          }));
      final CustomerAdressModel cusomerAdress =
          CustomerAdressModel.fromJson(res.data);

      preferences.setString('lat', '41.311081');
      preferences.setString('long', '	69.240562');

      await Dio().get('$baseUrl/v1/shippers/$shipperId');

      return cusomerAdress;
    } catch (e) {
      return;
    }
  }

  static getComputePrice(String branchId) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    // final accesToken = preferences.getString('acces_token');
    String acscestoken =
        '''eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NzU0MjMzNjUsImlhdCI6MTY3NDEyNzM2NSwiaXNzIjoidXNlciIsInNoaXBwZXJfaWQiOiJkNGIxNjU4Zi0zMjcxLTQ5NzMtODU5MS05OGE4MjkzOWE2NjQiLCJzdWIiOiJhODA3MTgyOS1jYTI0LTRjM2YtODU3ZS1lZTA0MjE5ZjUzYTgiLCJ1c2VyX3R5cGVfaWQiOiI5YjMxMjg2ZC1kYzIxLTQ1NzItYjIwYy05YjZjYjdkMjlkODkifQ.xFRPNwupNOp9bzcWXmCrucj4DrbROniBbcEIGqHVJp0''';

    final lat = preferences.getString('lat');
    final long = preferences.getString('long');

    final res = await Dio().patch('$baseUrl/v1/fares/compute-price',
        data: jsonEncode(<String, dynamic>{
          'branch_id': branchId,
          'lat': double.parse(lat!),
          'long': double.parse(long!),
        }),
        options: Options(headers: {
          'Authorization': acscestoken,
        }));
    await getOndemandOrder();
    await getOrder();
  }

  static getOndemandOrder() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final cusotmerId = preferences.getString('customer_id');
    final accesToken = preferences.getString('access_token');
    print('Cusomer id $cusotmerId');
    print('acsess id $accesToken');
    final res = await Dio().post('$baseUrl/v2/ondemand-order',
        data: jsonEncode(<String, dynamic>{
          "apartment": '',
          "building": '',
          "client_id": cusotmerId,
          "co_delivery_price": 0,
          "delivery_time": "",
          "delivery_type": 'self-pickup',
          "description": "",
          "is_courier_call": true,
          "extra_phone_number": "",
          "floor": '',
          "paid": false,
          "payment_type": 'cash',
          "source": "android",
          "status_id": "",
          "steps": [
            {
              "branch_id": '651ee775-4371-4dd0-a313-11ab2f584494',
              "description": "",
              "products": [
                {
                  "description": "",
                  "type": "simple",
                  "price": "14000",
                  "product_id": '23f141d6-f26f-4890-8ef0-999accbf1012',
                  "quantity": 1.0,
                  "order_modifiers": [],
                  "variants": []
                }
              ]
            }
          ],
          "to_address": 'Tashkent Uzbekistan',
          "to_location": {"lat": 41.311081, "long": 69.240562},
          "future_time": null
        }),
        options: Options(headers: {
          'Authorization': accesToken,
        }));

    print(
        "${res.data} ************************************************************************************ ondemand order");
  }

  static getOrder() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final accesToken = preferences.getString('access_token');
    print(" * *************** $accesToken");
   final res = await Dio().get('$baseUrl/v1/order',
        queryParameters: {
          "page": 1,
          'limit': 100,
          "status_ids": [
            "986a0d09-7b4d-4ca9-8567-aa1c6d770505",
            "ccb62ffb-f0e1-472e-bf32-d130bea90617",
            "1b6dc9a3-64aa-4f68-b54f-71ffe8164cd3",
            "b0cb7c69-5e3d-47c7-9813-b0a7cc3d81fd",
            "8781af8e-f74d-4fb6-ae23-fd997f4a2ee0",
            "84be5a2f-3a92-4469-8283-220ca34a0de4",
            "bf9cc968-367d-4391-93fa-f77eda2a7a99"
          ],
        },
        options: Options(headers: {
          'Authorization': accesToken,
        }));

    return ProductOrderModeli.fromJson(res.data);
  }

  static Future<void> refreshOrder() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final accesToken = preferences.getString('access_token');
    
    await Dio().get('$baseUrl/v1/order',
        queryParameters: {
          "page": 1,
          'limit': 10,
          "status_ids": [
            "986a0d09-7b4d-4ca9-8567-aa1c6d770505",
            "ccb62ffb-f0e1-472e-bf32-d130bea90617",
            "1b6dc9a3-64aa-4f68-b54f-71ffe8164cd3",
            "b0cb7c69-5e3d-47c7-9813-b0a7cc3d81fd",
            "8781af8e-f74d-4fb6-ae23-fd997f4a2ee0",
            "84be5a2f-3a92-4469-8283-220ca34a0de4",
            "bf9cc968-367d-4391-93fa-f77eda2a7a99"
          ],
        },
        options: Options(headers: {
          'Authorization': accesToken,
        }));
  }
}
