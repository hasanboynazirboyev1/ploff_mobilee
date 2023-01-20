import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:gap/gap.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/features/main_home/main_bloc/main_bloc.dart';
// import 'package:ploff_mobile/presentation/blocs/register/register_bloc.dart';
import 'package:ploff_mobile/features/register/presentation/pages/sign_name_page.dart';

import '../../data/datasouse/remote/sign_number.dart';
import '../bloc/register_bloc.dart';

class SignNumberPage extends StatefulWidget {
  const SignNumberPage({super.key});

  @override
  State<SignNumberPage> createState() => _SignNumberPageState();
}

class _SignNumberPageState extends State<SignNumberPage> {
  late TextEditingController numberController;

  @override
  void initState() {
    numberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    numberController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return KeyboardDismissOnTap(
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.only(
                    top: 46, left: 16, right: 16, bottom: 12),
                child: Column(
                  children: [
                    const Gap(24),
                    Container(
                      height: 33,
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Номер телефона",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Gap(24),
                    const Spacer(),
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
                      controller: numberController,
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
                    ElevatedButton(
                        onPressed: (() async {
                          final statusCode = await SignnumberApi.signNumber(
                              numberController.text);
                          if (statusCode == 200) {
                            Navigator.pushNamed(context, 'confirmlogin');
                          } else {
                            Navigator.pushNamed(context, 'registerconfirm');
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
