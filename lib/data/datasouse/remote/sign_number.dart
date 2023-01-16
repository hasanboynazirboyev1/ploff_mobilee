import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/presentation/screens/register/confirm_logn_page.dart';
import 'package:ploff_mobile/presentation/screens/register/sign_name_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignnumberApi {
  static signNumber(context, String number) async {
    try {
      final response = await Dio().post(
          'https://test.customer.api.delever.uz/v1/customers/phone',
          data: {'phone': "+998$number"},
          options: Options(headers: {'shipper': shipperId}));

      if (response.statusCode == 200) {
        await Dio().post('$baseUrl/v1/customers/login',
            data: {'phone': "+998$number", "tag": 'nimadur'},
            options: Options(headers: {'shipper': shipperId}));
      }
      final SharedPreferences setShared = await SharedPreferences.getInstance();
      await setShared.setString('phone', '+998$number');
      await setShared.setString('name', response.data['name']);
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => ConfirmLoginPage())));
    } catch (e) {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const SignNamePage())));
      print(e);
    }
  }
}
