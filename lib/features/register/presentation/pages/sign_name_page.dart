import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:gap/gap.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/features/register/data/datasouse/remote/register_api.dart';

import '../bloc/register_bloc.dart';
// import 'package:ploff_mobile/presentation/blocs/register/register_bloc.dart';

class SignNamePage extends StatefulWidget {
  const SignNamePage({super.key});

  @override
  State<SignNamePage> createState() => _SignNamePageState();
}

class _SignNamePageState extends State<SignNamePage> {
  late TextEditingController nameController;
  @override
  void initState() {
    nameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final registerBloc = context.read<RegisterBloc>();
    return KeyboardDismissOnTap(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding:
                const EdgeInsets.only(top: 46, left: 16, right: 16, bottom: 12),
            child: Column(
              children: [
                const Gap(24),
                Container(
                  height: 33,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "ism familya",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                ),
                const Gap(24),
                const Spacer(),
                Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Ism familya',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    )),
                const Gap(4),
                TextField(
                  autofocus: true,
                  controller: nameController,
                  decoration: InputDecoration(
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
                      await SignNameApi.registerName(name: nameController.text);
                      Navigator.pushNamed(context, 'registerconfirm');
                    }),
                    child: const Text('????????????????????')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
