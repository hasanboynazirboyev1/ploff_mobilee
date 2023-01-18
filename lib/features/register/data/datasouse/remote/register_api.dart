import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/features/register/presentation/pages/register_connfirm_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignNameApi {
  static registerName({ String? name}) async {
     final SharedPreferences preferences = await SharedPreferences.getInstance();
      final number = preferences.getString('phone');
    await Dio().post('$baseUrl/v1/customers/register',
        data: {'phone': "+998$number", 'name': name},
        options: Options(headers: {
          'shipper': shipperId,
        }));
   
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isActive', true);
    await prefs.setString('phone', '+998$number');
    await prefs.setString('name', name!);
    
  }
}
