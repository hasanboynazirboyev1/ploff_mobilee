import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class BacketPage extends StatelessWidget {
  const BacketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
        actions: [
          IconButton(onPressed: (() {
          
        }), icon: SvgPicture.asset('assets/svg_icons/order_icons/ic_delate.svg')),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Gap(0),
            Column(
              children: [
                Image.asset('assets/img/backet_default.png'),
                const Gap(24),
                const Text('В корзине пока нет продукты'),
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.height, 48)),
                onPressed: (() async {}),
                child: const Text('Продолжить')),
          ],
        ),
      ),
    );
  }
}
