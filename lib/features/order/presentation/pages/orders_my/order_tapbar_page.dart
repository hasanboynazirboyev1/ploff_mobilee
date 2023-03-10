import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_mobile/features/order/presentation/order_bloc/order_bloc.dart';
import 'package:ploff_mobile/features/order/presentation/pages/orders_my/order_active_page.dart';
import 'package:ploff_mobile/features/order/presentation/pages/orders_my/order_history_page.dart';
import 'order_default_page.dart';

class OrderTabBarPage extends StatefulWidget {
  const OrderTabBarPage({super.key});

  @override
  State<OrderTabBarPage> createState() => _OrderTabBarpageState();
}

class _OrderTabBarpageState extends State<OrderTabBarPage>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state is OrderHomeState) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text(
                  "Мои заказы",
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
                                    "Активные заказы",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    "История заказов",
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
                          children: [
                            state.productOrderModel == null
                                ? OrderDefaultPage()
                                : OrderActivePage(),
                            OrderHistoryPage(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
