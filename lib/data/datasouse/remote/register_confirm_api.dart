import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/presentation/screens/home/main_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterConfirmApi {
  static registerConfirm(context, {String? code, String? number}) async {
    try {
      await Dio().post('$baseUrl/v1/customers/register-confirm',
          data: {'phone': "+998$number", 'code': code},
          options: Options(headers: {
            'shipper': shipperId,
            'platform': '6bd7c2e3-d35e-47df-93ce-ed54ed53f95f'
          }));
      SharedPreferences setBoolean = await SharedPreferences.getInstance();
      await setBoolean.setBool('isActive', true);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: ((context) => const MainHomePage())),
          (route) => false);
    } catch (e) {}
  }
}
