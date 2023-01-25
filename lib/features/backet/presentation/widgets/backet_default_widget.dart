import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../main_home/presentation/main_bloc/main_bloc.dart';

class BacketDefaultWidget extends StatelessWidget {
  const BacketDefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mainBloc = context.read<MainBloc>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Gap(0),
        Column(
          children: [
            SizedBox(
                height: 104,
                width: 105,
                child: Image.asset('assets/img/backet_default.png')),
            const Gap(24),
            const Text(
              'В корзине пока нет продукты',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
              onPressed: (() {
                mainBloc.add(ThrowfirstPageEvent());
              }),
              child: const Text(
                'Добавить продукт',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              )),
        )
      ],
    );
  }
}
