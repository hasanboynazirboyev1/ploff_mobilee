import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:pinput/pinput.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/features/register/data/datasouse/remote/confirm_login_api.dart';
// import 'package:ploff_mobile/presentation/blocs/register/register_bloc.dart';
import 'package:ploff_mobile/features/main_home/presentation/pages/main_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/register_bloc.dart';

class ConfirmLoginPage extends StatefulWidget {
  const ConfirmLoginPage({
    super.key,
  });

  @override
  State<ConfirmLoginPage> createState() => _ConfirmLoginPageState();
}

class _ConfirmLoginPageState extends State<ConfirmLoginPage> {
  late TextEditingController codeController;

  @override
  void initState() {
    codeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    codeController.delete();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  Text(
                    "Регистрация",
                    style: TextStyle(
                        fontSize: 28,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                child: Form(
                  child: Pinput(
                    controller: codeController,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Неверный код";
                      }
                    },
                    length: 6,
                    defaultPinTheme: PinTheme(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey[200])),
                    focusedPinTheme: PinTheme(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.yellow),
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[200],
                        )),
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: (() async {
                    // final status = await ConfirmLoginApi.confirmLogin(
                    //     code: codeController.text);
                    // if (status == 200) {

                    // }
                    await confirmLogin(code: codeController.text);
                  }),
                  child: const Text('Продолжить')),
            ],
          ),
        ),
      ),
    );
  }

  confirmLogin({String? code}) async {
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
