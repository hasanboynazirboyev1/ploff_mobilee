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

import '../bloc/register_bloc.dart';

class ConfirmLoginPage extends StatefulWidget {
  ConfirmLoginPage({
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
  Widget build(BuildContext context) {
    final registerBloc = context.read<RegisterBloc>();
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        if (state is RegisterHomeState) {
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
                    Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            print(codeController.text);
                            final status = await ConfirmLoginApi.confirmLogin(code: codeController.text);
                            // if (status == 200) {
                              Navigator.pushNamedAndRemoveUntil(context, 'mainhome', (route) => false);
                            // }
                          },
                          child: Container(
                            height: 52,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: yellowColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Text(
                              "Продолжить",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
