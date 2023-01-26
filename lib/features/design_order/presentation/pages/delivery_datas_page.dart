import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:gap/gap.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/features/design_order/presentation/bloc/design_order_bloc.dart';
import 'package:ploff_mobile/features/design_order/presentation/widgets/call_curier_widget.dart';
import 'package:ploff_mobile/features/design_order/presentation/widgets/clock_order_widget.dart';
import 'package:ploff_mobile/features/design_order/presentation/widgets/customer_text_field_widget.dart';
import 'package:ploff_mobile/features/design_order/presentation/widgets/payment_type_widget.dart';
import 'package:ploff_mobile/features/design_order/presentation/widgets/product_check_widget.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class DeliveryDatasPage extends StatelessWidget {
  const DeliveryDatasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DesignOrderBloc, DesignOrderState>(
      builder: (context, state) {
        if (state is DesignOrderHomeState) {
          return KeyboardDismissOnTap(
            child: Scaffold(
              body: ListView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Адрес доставки',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        const Gap(16),
                        const Text('Текущий адрес',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400)),
                        const Gap(8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                              color: grayColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                              state.customerAdress.customerAddresses[0].address,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                        ),
                        const Gap(12),
                        const CustomerTextfieldWidget(),
                        const Gap(12),
                        Container(
                          height: 156,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: YandexMap(
                            onMapCreated:
                                ((YandexMapController controller) async {
                              controller.moveCamera(
                                  CameraUpdate.newCameraPosition(CameraPosition(
                                      target: Point(
                                          latitude: state.customerAdress
                                              .customerAddresses[0].location.lat,
                                          longitude: state
                                              .customerAdress
                                              .customerAddresses[0]
                                              .location
                                              .long))));
                            }),
                          ),
                        ),
                        const Gap(16),
                        const Text('Мои адреса', style: TextStyle(fontSize: 15)),
                        Gap(16),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                              color: grayColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .71,
                                child: Text(
                                    state.customerAdress.customerAddresses[0]
                                        .address,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400)),
                              ),
                              IconButton(
                                  onPressed: (() {}),
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_rounded))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(16),
                  const CallCurierWidget(),
                  const Gap(16),
                  const ClockOrderWidget(),
                  const Gap(16),
                  const PaymentTypeWidget(),
                  const Gap(16),
                  const ProductCheckWidget(),
                ],
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
