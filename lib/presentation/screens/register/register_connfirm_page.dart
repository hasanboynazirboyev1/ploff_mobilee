import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:pinput/pinput.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/presentation/blocs/register/register_bloc.dart';

class RegisterConfirm extends StatelessWidget {
  RegisterConfirm({
    super.key,
  });

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
                        // key: formGlobalKey,
          
                        child: Pinput(
                          controller: state.codeController,
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
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            registerBloc.add(RegisterConfirmEvent(context));
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
