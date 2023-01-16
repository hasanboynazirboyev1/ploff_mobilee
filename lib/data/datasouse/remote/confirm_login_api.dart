import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../presentation/screens/home/main_home_page.dart';

class ConfirmLoginApi {
  static confirmLogin({String? token, String? number, String? code}) async {
    try {
      await Dio().post('$baseUrl/v1/customers/confirm-login',
          data: {'phone:': number, 'fcm_token': token, 'code': code},
          options: Options(headers: {
            'shipper': shipperId,
            'platform': '6bd7c2e3-d35e-47df-93ce-ed54ed53f95f'
          }));
      SharedPreferences setBoolean = await SharedPreferences.getInstance();
        setBoolean.setBool('isActive', true);
    } catch (e) {}
  }
}
