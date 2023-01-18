import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../order_bloc/order_bloc.dart';


class OrderDatasPage extends StatelessWidget {
  const OrderDatasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state is OrderHomeState) {
          return Scaffold(
              appBar: AppBar(),
              body: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 17),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Заказ №341',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(34, 195, 72, 0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'Доставлен',
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xff22C348)),
                              ),
                            ),
                          ],
                        ),
                        Gap(30),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: 4,
                            itemBuilder: ((context, index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          state.orderIconList[index]),
                                      const Gap(12),
                                      Text(
                                        state.orderDatasKeyList[index],
                                        style: const TextStyle(
                                            color: Color(0xff858585),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const Spacer(),
                                      Text(
                                        state.orderDatasValList[index],
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  Gap(18),
                                ],
                              );
                            })),
                      ],
                    ),
                  ),
                  Gap(12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 11),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                            "assets/svg_icons/order_icons/ic_account.svg"),
                        const Gap(14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Курьер',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                            Gap(4),
                            Text(
                              'Abdullajanov Murod',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff858585)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
