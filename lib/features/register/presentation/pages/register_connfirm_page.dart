import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:pinput/pinput.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/features/register/data/datasouse/remote/register_confirm_api.dart';

import '../bloc/register_bloc.dart';
// import 'package:ploff_mobile/presentation/blocs/register/register_bloc.dart';

class RegisterConfirmPage extends StatefulWidget {
  RegisterConfirmPage({
    super.key,
  });

  @override
  State<RegisterConfirmPage> createState() => _RegisterConfirmPageState();
}

class _RegisterConfirmPageState extends State<RegisterConfirmPage> {
  late TextEditingController codeController;
  @override
  void initState() {
    codeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    codeController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registerBloc = context.read<RegisterBloc>();
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return KeyboardDismissOnTap(
          child: SafeArea(
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
                        // key: formGlobalKey,

                        child: Pinput(
                          controller: codeController,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return "Неверный код";
                            }
                          },
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
                          length: 6,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: (() async {
                          final a = await RegisterConfirmApi.registerConfirm(
                              code: codeController.text);
                          if (a == 200) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, 'mainhome', (route) => false);
                          }
                        }),
                        child: Text('Продолжить'))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
