import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_mobile/presentation/blocs/order_bloc/order_bloc.dart';
import 'package:ploff_mobile/presentation/screens/order/order_default_page.dart';
import 'package:ploff_mobile/presentation/screens/order/order_history_page.dart';

class OrderTabBarPage extends StatefulWidget {
  const OrderTabBarPage({super.key});

  @override
  State<OrderTabBarPage> createState() => _MoyZakazState();
}

class _MoyZakazState extends State<OrderTabBarPage>
    with TickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state is OrderHomeState) {
          return  Scaffold(
            backgroundColor: const Color(0xfff5f5f5),
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Мои заказы",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
              backgroundColor: Colors.white,
              elevation: 0,
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
                        child: Container(
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
                              tabs:const [
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
                          OrderDefaultPage(),
                          OrderHistoryPage(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
        }else{
          return CircularProgressIndicator();
        }
      },
    );
  }
}
