
import 'package:dio/dio.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';

class SignNameApi{
  static confirmLogin({ String? number,String? name}) async {
     var response = await Dio().post('$baseUrl/v1/customers/confirm-login',
        data: {'phone:': number,'name':name},
        options: Options(headers: {
          'shipper': shipperId,
        }));
        return response.data;

  }
}