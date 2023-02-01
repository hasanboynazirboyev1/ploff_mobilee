import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ploff_mobile/features/order/presentation/order_bloc/order_bloc.dart';
import 'package:ploff_mobile/features/order/presentation/pages/orders_my/order_active_page.dart';
import 'package:ploff_mobile/features/order/presentation/widgets/order_datas_widget.dart';

class OrderDefaultPage extends StatefulWidget {
  const OrderDefaultPage({super.key});

  @override
  State<OrderDefaultPage> createState() => _OrderDefaultPageState();
}

class _OrderDefaultPageState extends State<OrderDefaultPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state is OrderHomeState) {
          return Scaffold(
              body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(1),
                Column(
                  children: [
                    Image.asset('assets/img/order_default.png'),
                    const Gap(36),
                    const Text(
                      'У вас нет активных заказов',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.telegram,
                      size: 30,
                      color: Colors.blue,
                    ),
                    const Gap(35),
                    Image.asset('assets/img/ic_instagram.png', height: 25),
                    const Gap(35),
                    const Icon(Icons.facebook, color: Colors.blue, size: 30),
                  ],
                ),
              ],
            ),
          ));
        } else {
          return SizedBox();
        }
      },
    );
  }
}
