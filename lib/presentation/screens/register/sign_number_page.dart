import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/presentation/blocs/register/register_bloc.dart';

class SignNumberPage extends StatelessWidget {
  const SignNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    final registerBloc = context.read<RegisterBloc>();
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        if (state is RegisterHomeState) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 46, left: 16, right: 16),
              child: Column(
                children: [
                  const Gap(24),
                  Container(
                    height: 33,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Номер телефона",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Gap(24),
                  Spacer(),
                  Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Номер телефона',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      )),
                  
                  const Gap(4),
                  TextField(
                    autofocus: true,
                    controller: state.numberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixText: '+998',
                      hintStyle: const TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: yellowColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: yellowColor)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: yellowColor)),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: InkWell(
                      onTap: () {
                        registerBloc.add(SignNumberEvent(context));
                      },
                      child: Container(
                        height: 52,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: yellowColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          "Продолжить",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
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
