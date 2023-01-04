import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/datasouse/remote/confirm_login_api.dart';
import 'package:ploff_mobile/presentation/blocs/register/register_bloc.dart';
import 'package:ploff_mobile/presentation/screens/home/main_home_page.dart';

class ConfirmLoginPage extends StatelessWidget {
  ConfirmLoginPage({super.key, this.token});
  String? token;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        if (state is RegisterHomeState) {
          return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(CupertinoIcons.back))),
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
                      // key: formGlobalKey,

                      child: Pinput(
                        controller: state.codeController,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Неверный код";
                          }
                        },
                        length: 6,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          await ConfirmLoginApi.confirmLogin(
                              token: token!,
                              number: state.numberController.text,
                              code: state.codeController.text);
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: ((context) => MainHomePage())), (route) => false);
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
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
