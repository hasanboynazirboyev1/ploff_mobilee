import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main_home/presentation/pages/main_home_page.dart';

class ConfirmLoginApi {
  static confirmLoginn(context, {String? code}) async {
    try {
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final phone = preferences.getString('phone');

      final res = await Dio().post('$baseUrl/v1/customers/confirm-login',
          data: {
            'phone': phone,
            'fcm_token':
                "c5QOfICbQQyc17uiUUi9Ae:APA91bHErn_4T5Ucv8R8xlXsPk7gSjonKEBgfjJU2WDo6lZRl-6VIL_P_TWATqmv_9T-ItIOtZO7HEeq1juOZVQSxgaKzN2E46TQKj53r3bXqcUBEvjLMXs3EAW4vUbnSVNx-8fjxAlt",
            'code': code
          },
          options: Options(headers: {
            'shipper': shipperId,
            'platform': '6bd7c2e3-d35e-47df-93ce-ed54ed53f95f'
          }));
      await preferences.setBool('isActive', true);
      await preferences.setString('access_token', res.data['access_token']);

      Navigator.pushNamedAndRemoveUntil(context, 'mainhome', (route) => false);
    } catch (e) {
      print(e);
    }
  }
}
