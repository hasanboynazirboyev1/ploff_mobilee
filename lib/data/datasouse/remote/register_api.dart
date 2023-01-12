import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/presentation/screens/register/register_connfirm_page.dart';

class SignNameApi {
  static registerName(context,{String? number, String? name}) async {
    await Dio().post('$baseUrl/v1/customers/register',
        data: {'phone': "+998$number", 'name': name},
        options: Options(headers: {
          'shipper': shipperId,
        }));
        Navigator.push(context, MaterialPageRoute(builder: ((context) => RegisterConfirm())));
  }
}
