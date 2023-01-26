import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_mobile/features/design_order/presentation/bloc/design_order_bloc.dart';
import 'package:ploff_mobile/features/design_order/presentation/pages/delivery_datas_page.dart';
import 'package:ploff_mobile/features/design_order/presentation/pages/pick_up_page.dart';

import '../../data/repository/design_order_api.dart';

class DesignOrderTabBarPage extends StatefulWidget {
  const DesignOrderTabBarPage({super.key});

  @override
  State<DesignOrderTabBarPage> createState() => _DesignOrderTabBarPageState();
}

class _DesignOrderTabBarPageState extends State<DesignOrderTabBarPage>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DesignOrderBloc, DesignOrderState>(
      builder: (context, state) {
        if (state is DesignOrderHomeState) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text(
                  "Оформить заказ",
                ),
              ),
              body: Center(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.9),
                            color: const Color(0xfff5f5f5),
                          ),
                          child: SizedBox(
                            height: 28,
                            child: Container(
                              margin: EdgeInsets.all(3),
                              child: TabBar(
                                indicator: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6.93),
                                ),
                                controller: tabController,
                                onTap: (value) {},
                                tabs: const [
                                  Text(
                                    "Доставка",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "Самовывоз",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: const Color(0xfff5f5f5),
                        child: TabBarView(
                          controller: tabController,
                          children: const [
                            DeliveryDatasPage(),
                            PickUpPage(),
                          ],
                        ),
                      ),
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
