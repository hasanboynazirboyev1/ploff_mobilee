import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/features/order/presentation/order_bloc/order_bloc.dart';

class OrderDatasWidget extends StatelessWidget {
  OrderDatasWidget({super.key, this.index});
  int? index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state is OrderHomeState) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            margin: EdgeInsets.only(bottom: 16, top: index == 0 ? 16 : 0),
            height: 144,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Заказ №${(state.productOrderModel!.orders[index!].externalOrderId)}",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(14, 115, 246, 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Готовится',
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff0E73F6)),
                      ),
                    ),
                  ],
                ),
                Gap(28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                            'assets/svg_icons/order_icons/ic_order_check.svg',
                            height: 56),
                        Container(
                          height: 1.6,
                          width: MediaQuery.of(context).size.height * .06,
                          color: Color.fromRGBO(245, 193, 9, 1),
                        ),
                        SvgPicture.asset(
                            'assets/svg_icons/order_icons/ic_cook.svg',
                            height: 56),
                      ],
                    ),
                    SvgPicture.asset('assets/svg_icons/order_icons/ic_car.svg',
                        height: 56),
                    SvgPicture.asset('assets/svg_icons/order_icons/ic_flag.svg',
                        height: 56),
                  ],
                ),
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
