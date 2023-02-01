import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:gap/gap.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/features/design_order/data/repository/design_order_api.dart';
import 'package:ploff_mobile/features/design_order/presentation/bloc/design_order_bloc.dart';
import 'package:ploff_mobile/features/design_order/presentation/widgets/call_curier_widget.dart';
import 'package:ploff_mobile/features/design_order/presentation/widgets/clock_order_widget.dart';
import 'package:ploff_mobile/features/design_order/presentation/widgets/customer_text_field_widget.dart';
import 'package:ploff_mobile/features/design_order/presentation/widgets/payment_type_widget.dart';
import 'package:ploff_mobile/features/design_order/presentation/widgets/product_check_widget.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class DeliveryDatasPage extends StatefulWidget {
  const DeliveryDatasPage({super.key});

  @override
  State<DeliveryDatasPage> createState() => _DeliveryDatasPageState();
}

class _DeliveryDatasPageState extends State<DeliveryDatasPage> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController(text: 'Tashkent Uzbekistan');
    super.initState();
  }

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
                          decoration: BoxDecoration(
                              color: grayColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: SizedBox(
                            height: 48,
                            width: MediaQuery.of(context).size.width,
                            child: TextField(
                              controller: controller,
                              style: const TextStyle(fontSize: 15),
                              decoration: InputDecoration(
                                isDense: true,
                                hintStyle: const TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff858585),
                                    fontWeight: FontWeight.w400),
                                fillColor: const Color(0xffF5F5F5),
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: yellowColor),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
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
                                          latitude: 41.311081,
                                          longitude: 69.240562))));
                            }),
                          ),
                        ),
                        const Gap(16),
                        const Text('Мои адреса',
                            style: TextStyle(fontSize: 15)),
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
                                child: Text('Tashkent Uzbekistan',
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
                  ProductCheckWidget(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: whiteColor,
                      padding: EdgeInsets.all(16),
                      child: ElevatedButton(
                        child: Text('Оформить заказ'),
                        onPressed: () async {
                          await DesigOrderApi.getComputePrice(
                              "651ee775-4371-4dd0-a313-11ab2f584494");
                              Navigator.pushNamedAndRemoveUntil(context, 'mainhome', (route) => false);
                        },
                      ),
                    ),
                  ),
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
